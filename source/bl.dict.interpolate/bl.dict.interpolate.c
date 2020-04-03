/*
Created by Balint Laczko - balintlaczko01@gmail.com
2019, Oslo
*/

#include "ext.h"
#include "ext_obex.h"
#include "ext_strings.h"
#include "ext_dictobj.h"


typedef struct _bl_dict_interpolate {
	t_object		obj;					
	void			*outlet_interp;			//left outlet
	long			m_in;					//space for the inlet number used by all the proxies
	void			*m_proxy;				//the proxy for the inlets
	t_symbol		*name_left;				//we will store the name of the left dict here
	t_symbol		*name_right;			//we will store the name of the right dict here
	double			ratio;					//we save the ratio here
	long			attr_dictoutput;		
	t_symbol		*name;					
	t_dictionary	*dictionary;			
	void			*m_qelem;				
} t_bl_dict_interpolate;


// prototypes
void *bl_dict_interpolate_new(t_symbol *s, long ac, t_atom *av);
void bl_dict_interpolate_free(t_bl_dict_interpolate *x); 
void bl_dict_interpolate_assist(t_bl_dict_interpolate *x, void *b, long m, long a, char *s); 
void bl_dict_interpolate_dictionary(t_bl_dict_interpolate *x, t_symbol *s); //dict input
void bl_dict_interpolate_ratio(t_bl_dict_interpolate *x, double f); //receiving ratio and triggering interpolation in main thread
void bl_dict_interpolate_interp(t_bl_dict_interpolate *x); //this is doing the heavy lifting, wrapped in a q_elem
void iterate_dicts(t_dictionary_entry *entry, t_bl_dict_interpolate *x);
double scale(double val, double in_low, double in_high, double out_low, double out_high);
t_max_err bl_dict_interpolate_setattr_dictoutput(t_bl_dict_interpolate *x, void *attr, long ac, t_atom *av);
void bl_dict_interpolate_setattr_name(t_bl_dict_interpolate *x, void *attr, long argc, t_atom *argv);


// class statics/globals
static t_class	*s_bl_dict_interpolate_class; //pointer for the class definition
static t_symbol	*ps_dictionary; //"dictionary"
static t_symbol *ps_modified; //"modified"
static t_symbol *ps_name; //"name"


/************************************************************************************/
void ext_main(void *r)
{
	t_class	*c = class_new("bl.dict.interpolate", (method)bl_dict_interpolate_new, (method)bl_dict_interpolate_free, sizeof(t_bl_dict_interpolate), (method)NULL, A_GIMME, 0);
	
	class_addmethod(c, (method)bl_dict_interpolate_dictionary, 	"dictionary", 	A_SYM, 0);
	class_addmethod(c, (method)bl_dict_interpolate_ratio,		"float",		A_FLOAT, 0);
	class_addmethod(c, (method)bl_dict_interpolate_assist,		"assist",		A_CANT, 0);

	//create the attribute(s)
	CLASS_ATTR_LONG(c, "dictoutput", 0, t_bl_dict_interpolate, attr_dictoutput);
	CLASS_ATTR_ACCESSORS(c, "dictoutput", NULL, bl_dict_interpolate_setattr_dictoutput);
	CLASS_ATTR_FILTER_CLIP(c, "dictoutput", 0, 1);
	CLASS_ATTR_SELFSAVE(c, "dictoutput", 0);
	CLASS_ATTR_CATEGORY(c, "dictoutput", 0, "Output mode");
	CLASS_ATTR_LABEL(c, "dictoutput", 0, "dictoutput");
	CLASS_ATTR_BASIC(c, "dictoutput", 0); 

	CLASS_ATTR_SYM(c, "name", 0, t_bl_dict_interpolate, name);
	CLASS_ATTR_ACCESSORS(c, "name", NULL, bl_dict_interpolate_setattr_name);
	CLASS_ATTR_CATEGORY(c, "name", 0, "Dictionary");
	CLASS_ATTR_LABEL(c, "name", 0, "Name");
	CLASS_ATTR_BASIC(c, "name", 0);

	class_register(CLASS_BOX, c);
	s_bl_dict_interpolate_class = c;

	ps_dictionary = gensym("dictionary");
	ps_modified = gensym("modified");
	ps_name = gensym("name");
}


/************************************************************************************/
void *bl_dict_interpolate_new(t_symbol *s, long ac, t_atom *av)
{
	t_bl_dict_interpolate 	*x;

	x = (t_bl_dict_interpolate *)object_alloc(s_bl_dict_interpolate_class);

	if (x) {
		attr_args_process(x, ac, av);

		if (x->attr_dictoutput) {
			x->outlet_interp = outlet_new(x, "dictionary"); //we will output the interpolation as a dictionary
		}
		else {
			x->outlet_interp = floatout(x); //we will fire the interp messages through this outlet
		}

		x->m_proxy = proxy_new((t_object *)x, 1, &x->m_in); //the inlets via the proxy
		x->m_qelem = qelem_new((t_object *)x, (method)bl_dict_interpolate_interp); //a new queue element
	}
	return x;
}


void bl_dict_interpolate_free(t_bl_dict_interpolate *x)
{
	object_free(x->m_proxy);
	object_free((t_object *)x->dictionary); // will call object_unregister
	qelem_free(x->m_qelem);
}


/************************************************************************************/
void bl_dict_interpolate_assist(t_bl_dict_interpolate *x, void *b, long m, long a, char *s)
{
	if (m==ASSIST_INLET) {
		switch (a) {
		case 0: strcpy(s, "dictionary to interpolate from or ratio as a float (0...1)"); break;
		case 1: strcpy(s, "dictionary to interpolate to"); break;
		}
	}
	else if (m==ASSIST_OUTLET) {
		if (x->attr_dictoutput == 1) {
			strcpy(s, "fire the interpolation as a dictionary out from here");
		}
		else {
			strcpy(s, "fire the interpolation messages out from here");
		}
	}
}

/************************************************************************************/
//get dict names and save them
void bl_dict_interpolate_dictionary(t_bl_dict_interpolate *x, t_symbol *s)

{
	t_dictionary	*d = dictobj_findregistered_retain(s);
	long			inlet;

	if (!d) {
		object_error((t_object *)x, "unable to reference dictionary named %s", s);
		return;
	}

	inlet = proxy_getinlet((t_object *)x);

	if (inlet == 1) {
		x->name_right = s;
	}
	else {
		x->name_left = s;
	}

	dictobj_release(d);
}

//when we get a float we trigger the interpolation
void bl_dict_interpolate_ratio(t_bl_dict_interpolate *x, double f) {
	//clamping the input float between 0 and 1
	if (f > 1) {
		x->ratio = 1;
	}
	else if (f < 0) {
		x->ratio = 0;
	}
	else {
		x->ratio = f;
	}
	//calling the interpolation in low priority thread (so it cannot get overloaded if triggered too often)
	qelem_set(x->m_qelem);
}

//here we do the interpolation
void bl_dict_interpolate_interp(t_bl_dict_interpolate *x) 
{
t_dictionary	*d_from;
t_dictionary	*d_to;
t_symbol		**keys_from = NULL;
long			numkeys_from = 0;

if (x->name_left && x->name_right) { //only if the inputs were defined previously

	//clear the internal dict before the interpolation
	if (x->attr_dictoutput && x->name) {
		dictionary_clear(x->dictionary);
	}

	//find the input dicts
	d_from = dictobj_findregistered_retain(x->name_left);
	d_to = dictobj_findregistered_retain(x->name_right);

	//we call the interpolator method for every dict entry
	dictionary_funall(d_from, (method)iterate_dicts, x);

	//after we have done the interpolation...
	//if we are in "dictoutput" mode, now send the dictionary
	//(in normal mode we have sent the values already)
	if (x->attr_dictoutput) {
		//notify
		object_notify(x->dictionary, ps_modified, NULL);
		//output dict
		if (x->name) {
			t_atom	a[1];

			atom_setsym(a, x->name);
			outlet_anything(x->outlet_interp, ps_dictionary, 1, a);
			//dictionary_clear(x->dictionary);
		}
	}
	//release both dicts
	dictobj_release(d_from);
	dictobj_release(d_to);
}
//if we try to interpolate, but forgot to link source dicts first...
else {
	if (!x->name_left) {
		object_error((t_object *)x, "No dictionary given to interpolate from.");
	}
	else if (!x->name_right) {
		object_error((t_object *)x, "No dictionary given to interpolate to.");
	}

}
}

//this is the heavy lifting: get key and content of the dict entry, and interpolate between the two values
void iterate_dicts(t_dictionary_entry *entry, t_bl_dict_interpolate *x)
{
	t_dictionary	*d_from = dictobj_findregistered_retain(x->name_left);
	t_dictionary	*d_to = dictobj_findregistered_retain(x->name_right);
	t_symbol		*key;
	t_atom			a[2];
	t_atom			b[2];
	t_max_err		err;
	t_max_err		err1;
	t_max_err		err2;
	t_max_err		err3;
	t_atom			akey[1];
	t_atom			bkey[1];
	t_dictionary	*d0 = NULL;
	t_dictionary	*d1 = NULL;
	t_dictionary	*d00 = dictionary_new();
	t_dictionary	*d11 = dictionary_new();
	t_symbol		*key0 = NULL;
	t_symbol		*key1 = NULL;
	double			scaled_float;
	t_atom			c[2];
	//for the old way...
	//float			extracted_array_a[128];
	//float			extracted_array_b[128];
	//float			output_array[128];
	long			i;
	long			errorflag = 0;

	//get the key's name
	key = dictionary_entry_getkey(entry);
	atom_setsym(akey, key);
	atom_setsym(bkey, key);

	//attempt to parse the key
	err = dictobj_key_parse((t_object *)x, d_from, akey, false, &d0, &key0, NULL);
	if (err) {
		object_error((t_object *)x, "could not parse key %s in %s", key->s_name, x->name_left);
	}
	err1 = dictobj_key_parse((t_object *)x, d_to, bkey, false, &d1, &key1, NULL);
	if (err1) {
		object_error((t_object *)x, "could not parse key %s in %s", key->s_name, x->name_right);
	}

	//copy the dicts
	dictionary_copyunique(d11, d1);
	dictionary_copyunique(d00, d0);
	
	//attempt to get the value of it
	err = dictionary_getatom(d00, key0, a); //d0
	err1 = dictionary_getatom(d11, key1, b); //d1


	//if both dicts have something with this keyname
	if (!err && !err1) {

		if (atomisatomarray(a) && atomisatomarray(b)) { //if the values are arrays
			t_atom	*av = NULL;
			long	ac = 0;
			t_atom	*bv = NULL;
			long	bc = 0;

			//copy the atoms -- old way
			//atomarray_copyatoms((t_atomarray *)a->a_w.w_obj, &ac, &av);
			//atomarray_copyatoms((t_atomarray *)b->a_w.w_obj, &bc, &bv);

			//now we use this instead, because it can convert strings to symbols
			err2 = dictionary_getatoms_ext(d00, key0, true, &ac, &av);
			err3 = dictionary_getatoms_ext(d11, key1, true, &bc, &bv);

			if (!err2 && !err3) {

				//loop through the array
				for (i = 0; i < ac; i++) {
					//if it's a number, interpolate it
					if ((atom_gettype(av + i) == A_FLOAT || atom_gettype(av + i) == A_LONG) && (atom_gettype(bv + i) == A_FLOAT || atom_gettype(bv + i) == A_LONG)) {
						scaled_float = scale(x->ratio, 0, 1, atom_getfloat(av + i), atom_getfloat(bv + i));
						atom_setfloat(av + i, scaled_float);
					} 
					//if only this one is a number
					else if ((atom_gettype(av + i) == A_FLOAT || atom_gettype(av + i) == A_LONG) && !(atom_gettype(bv + i) == A_FLOAT || atom_gettype(bv + i) == A_LONG)) {
						errorflag = 1;
						object_error((t_object *)x, "key %s : element %ld has different types of data in the two source dicts.", key->s_name, i);
					}
					//if only that one is a number
					else if (!(atom_gettype(av + i) == A_FLOAT || atom_gettype(av + i) == A_LONG) && (atom_gettype(bv + i) == A_FLOAT || atom_gettype(bv + i) == A_LONG)) {
						errorflag = 1;
						object_error((t_object *)x, "key %s : element %ld has different types of data in the two source dicts.", key->s_name, i);
					}
					else if (atom_gettype(av + i) == A_SYM && atom_gettype(bv + i) == A_SYM) {
						; //if it's a symbol at both places, just pass it
					}
					//if only one of them is a symbol
					else if ((atom_gettype(av + i) == A_SYM && atom_gettype(bv + i) != A_SYM) || (atom_gettype(av + i) != A_SYM && atom_gettype(bv + i) == A_SYM)) {
						errorflag = 1;
						object_error((t_object *)x, "key %s : element %ld has different types of data in the two source dicts.", key->s_name, i);
					}
					else { //if the array element is neither a number, nor a symbol
						errorflag = 1;
						object_error((t_object *)x, "key %s : element %ld is neither a number, nor a symbol.", key->s_name, i);
					}
				}

				//old way: safe, but works only with numbers...
				/*atom_getfloat_array(ac, av, ac, &extracted_array_a);
				atom_getfloat_array(bc, bv, bc, &extracted_array_b);

				for (i = 0; i < ac; i++) {
					output_array[i] = scale(x->ratio, 0, 1, extracted_array_a[i], extracted_array_b[i]);
				}

				atom_setfloat_array(ac, av, ac, &output_array);*/

				if (errorflag == 0) {
					//if there were other things (like strings) than numbers in the array, then only output the "to" value when we finish the interpolation 
					if (x->attr_dictoutput) {
						if (x->ratio == 1) {
							dictionary_appendatoms(x->dictionary, key, bc, bv);
						}
						else {
							dictionary_appendatoms(x->dictionary, key, ac, av);
						}
					}
					else {
						if (x->ratio == 1) {
							outlet_anything(x->outlet_interp, key, bc, bv);
						}
						else {
							outlet_anything(x->outlet_interp, key, ac, av);
						}
					}
				}
				else {
					;
				}
			}
			//free the memory consumed by av and bv
			sysmem_freeptr(av); 
			sysmem_freeptr(bv);
		}
		
		else if (atomisdictionary(a) && atomisdictionary(b)) { //if the value is a dict (subdict)
			//we only output them in "hard-left" (ratio == 0) or "hard-right" (ratio == 1) states
			if (x->ratio == 0) {
				t_dictionary	*d1_original = (t_dictionary *)atom_getobj(a); //get the original one (left-side)
				t_symbol		*d1_original_name;
				t_dictionary	*d1 = dictionary_new(); //make a new one in which we will copy its contents
				t_symbol		*d1_name = NULL;

				//register our new dict with an autogenerated name
				dictobj_register(d1, &d1_name);

				d1_original_name = dictobj_namefromptr(d1_original); //get the name of the original one
				if (!d1_original_name) //if there was no name given
					dictobj_register(d1_original, &d1_original_name); //then regeister it with an autogenerated name

				//copy all of it (NB. the new is empty now) into the new one
				dictionary_copyunique(d1, d1_original);

				//atom "a" should be "dictionary <name-of-the-new-dict>"
				atom_setsym(a, ps_dictionary);
				atom_setsym(a + 1, d1_name);

				//save the new one into the interp dict or just output the copied subdict as a value
				if (x->attr_dictoutput) {
					dictionary_appenddictionary(x->dictionary, key, (t_object *)d1);
				}
				else {
					outlet_anything(x->outlet_interp, key, 2, a);
					//in non-dictionary output mode we don't need this, so just free it
					object_free(d1);
				}
			}

			//"hard-right" state, basically the same process but using the value from the right-side source dict
			else if (x->ratio == 1) {
				t_dictionary	*d1_original = (t_dictionary *)atom_getobj(b); //get the original one (right-side)
				t_symbol		*d1_original_name;
				t_dictionary	*d1 = dictionary_new(); //make a new one in which we will copy its contents
				t_symbol		*d1_name = NULL;

				//register our new dict with an autogenerated name
				dictobj_register(d1, &d1_name);

				d1_original_name = dictobj_namefromptr(d1_original); //get the name of the original one
				if (!d1_original_name) //if there was no name given
					dictobj_register(d1_original, &d1_original_name); //then regeister it with an autogenerated name

				//copy all of it (NB. the new is empty now) into the new one
				dictionary_copyunique(d1, d1_original);

				//atom "a" should be "dictionary <name-of-the-new-dict>"
				atom_setsym(b, ps_dictionary);
				atom_setsym(b + 1, d1_name);

				//save the new one into the interp dict or just output the copied subdict as a value
				if (x->attr_dictoutput) {
					dictionary_appenddictionary(x->dictionary, key, (t_object *)d1);
				}
				else {
					outlet_anything(x->outlet_interp, key, 2, b);
					//in non-dictionary output mode we don't need this, so just free it
					object_free(d1);
				}
			}
		}
		else if (atom_gettype(a) == A_SYM && atom_gettype(b) == A_SYM) { //if the values are symbols
			//similarly, only output them in "hard-left" or "hard-right" states
			if (x->ratio == 0) {
				if (x->attr_dictoutput) {
					dictionary_appendsym(x->dictionary, key, atom_getsym(a));
				}
				else {
					outlet_anything(x->outlet_interp, key, 1, a);
				}	
			}
			else if (x->ratio == 1) {
				if (x->attr_dictoutput) {
					dictionary_appendsym(x->dictionary, key, atom_getsym(b));
				}
				else {
					outlet_anything(x->outlet_interp, key, 1, b);
				}
			}
		}
		else { //if it's a single number
			
			//do the interpolation
			scaled_float = scale(x->ratio, 0, 1, atom_getfloat(a), atom_getfloat(b));
			//put result into the output atom
			atom_setfloat(c, scaled_float);

			//output
			if (x->attr_dictoutput) {
				dictionary_appendfloat(x->dictionary, key, atom_getfloat(c));
			}
			else {
				outlet_anything(x->outlet_interp, key, 1, c);
			}
			
		}
	} //if there was no match, then don't do anything

	//release the dicts
	dictobj_release(d_from);
	dictobj_release(d_to);
	object_free(d11);
	object_free(d00);
}

//interpolator
double scale(double val, double in_low, double in_high, double out_low, double out_high) {
	return ((val - in_low) * (out_high - out_low)) / (in_high - in_low) + out_low;
}

//setter for the "dictoutput" attribute
t_max_err bl_dict_interpolate_setattr_dictoutput(t_bl_dict_interpolate *x, void *attr, long ac, t_atom *av)
{
	if (ac && av) {
		t_atom_long mode = atom_getlong(av);
		t_symbol	*name = NULL;

		//make it behave as a boolean
		if (mode < 0) {
			mode = 0;
		}
		else if (mode > 1) {
			mode = 1;
		}

		if (x->attr_dictoutput != mode) { //prevent repetitions

			//set the attribute
			x->attr_dictoutput = mode;

			//if it's on
			if (x->attr_dictoutput == 1) {
				x->dictionary = dictionary_new(); //make the internal dict where we will store the interpolation
				x->dictionary = dictobj_register(x->dictionary, &name); //and register it with a random name
				x->name = name; //save the random name
				if (!x->dictionary)
					object_error((t_object *)x, "could not create dictionary named %s", name->s_name);
			}
			//if it's off
			else {
				if (x->dictionary) {
					object_free(x->dictionary); // will call object_unregister
				}
			}
		}
	}
	return MAX_ERR_NONE;
}

//setter for the "name" attribute
void bl_dict_interpolate_setattr_name(t_bl_dict_interpolate *x, void *attr, long argc, t_atom *argv)
{
	if (x->attr_dictoutput == 1) { //will only work if the dictoutput is switched on
		t_symbol		*name = atom_getsym(argv);

		if (!x->name || !name || x->name != name) {
			if (x->dictionary) {
				object_free(x->dictionary); // will call object_unregister
			}

			//remake the dict and register it with the user-given name
			x->dictionary = dictionary_new();
			x->dictionary = dictobj_register(x->dictionary, &name);
			x->name = name; //and save that name
		}
		if (!x->dictionary)
			object_error((t_object *)x, "could not create dictionary named %s", name->s_name);
	}
	else {
		object_error((t_object *)x, "Object is not in dictoutput mode.");
	}

}
