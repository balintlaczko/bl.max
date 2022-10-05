/*
Created by Balint Laczko - balintlaczko01@gmail.com
2020, Oslo
*/

#include "ext.h"
#include "ext_obex.h"
#include "jpatcher_api.h"
#include "jgraphics.h"
#include "ext_path.h"

// object struct
typedef struct bl_patch_capture
{
	t_object obj;
	char filename[MAX_PATH_CHARS];
	long snip_x;
	long snip_y;
	long snip_width;
	long snip_height;
	long attr_rect[4];
	long attr_dpi;
	t_symbol *attr_filename;
} t_bl_patch_capture;

// function prototypes
void *bl_patch_capture_new(t_symbol *s, long argc, t_atom *argv);
void bl_patch_capture_free(t_bl_patch_capture *x);
void bl_patch_capture_assist(t_bl_patch_capture *x, void *b, long m, long a, char *s);
void bl_patch_capture_bang(t_bl_patch_capture *x); // incoming bang message
t_max_err bl_patch_capture_setattr_rect(t_bl_patch_capture *x, void *attr, long ac, t_atom *av); // set rect attribute
t_max_err bl_patch_capture_setattr_filename(t_bl_patch_capture *x, void *attr, long ac, t_atom *av); // set name attribute

// global class pointer variable
void *bl_patch_capture_class;

void ext_main(void *r)
{
	t_class *c;

	c = class_new("bl.patch.capture", (method)bl_patch_capture_new, (method)bl_patch_capture_free, (long)sizeof(t_bl_patch_capture), 0L, A_GIMME, 0);

	class_addmethod(c, (method)bl_patch_capture_bang, "bang", 0);
	class_addmethod(c, (method)bl_patch_capture_assist, "assist", A_CANT, 0);

	// create the attribute(s)
	// rect
	CLASS_ATTR_LONG_ARRAY(c, "rect", 0, t_bl_patch_capture, attr_rect, 4);
	CLASS_ATTR_ACCESSORS(c, "rect", NULL, bl_patch_capture_setattr_rect);
	CLASS_ATTR_FILTER_MIN(c, "rect", 0);
	CLASS_ATTR_SELFSAVE(c, "rect", 0);
	CLASS_ATTR_CATEGORY(c, "rect", 0, "Rectangle");
	CLASS_ATTR_LABEL(c, "rect", 0, "Rect");
	CLASS_ATTR_BASIC(c, "rect", 0);

	// dpi
	CLASS_ATTR_LONG(c, "dpi", 0, t_bl_patch_capture, attr_dpi);
	CLASS_ATTR_FILTER_MIN(c, "dpi", 1);
	CLASS_ATTR_SELFSAVE(c, "dpi", 0);
	CLASS_ATTR_CATEGORY(c, "dpi", 0, "Resolution");
	CLASS_ATTR_LABEL(c, "dpi", 0, "DPI");
	CLASS_ATTR_BASIC(c, "dpi", 0);
	
	// name
	CLASS_ATTR_SYM(c, "name", 0, t_bl_patch_capture, attr_filename);
	CLASS_ATTR_ACCESSORS(c, "name", NULL, bl_patch_capture_setattr_filename);
	CLASS_ATTR_SELFSAVE(c, "name", 0);
	CLASS_ATTR_CATEGORY(c, "name", 0, "Filename");
	CLASS_ATTR_LABEL(c, "name", 0, "Name");
	CLASS_ATTR_BASIC(c, "name", 0);

	class_register(CLASS_BOX, c);
	bl_patch_capture_class = c;

}

// inlet assist
void bl_patch_capture_assist(t_bl_patch_capture *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET) { //inlet
		sprintf(s, "bang, name filename.png, rect x y width height, dpi number", a);
	}
}

// bang
void bl_patch_capture_bang(t_bl_patch_capture *x)
{
	t_object *jp;
	t_object *pv;
	t_rect rect;
	t_jsurface *surface;
	short *path_id;
	long dpi;

	t_max_err err;

	// get the object's parent patcher
	err = object_obex_lookup(x, gensym("#P"), (t_object **)&jp);
	if (err != MAX_ERR_NONE)
		return;

	// fetch patcher view
	pv = jpatcher_get_firstview(jp);

	// default path will be the same folder where the patcher is saved
	path_id = path_getdefault();

	// fetch dpi attribute
	dpi = x->attr_dpi;

	// if the patcher view is successfully retrieved
	if (pv) {
		// set the rectangle area in the patch for the captured image
		rect.x = x->snip_x;
		rect.y = x->snip_y;
		rect.width = x->snip_width;
		rect.height = x->snip_height;

		// get an image of the patch as a surface
		surface = object_method(pv, gensym("getimage"), &rect);

		// if that went well
		if (surface)
		{
			// export the png from the surface
			err = jgraphics_image_surface_writepng(surface, x->filename, path_id, dpi);
			if (err != MAX_ERR_NONE)
				object_post((t_object *)x, "Error while writing image");

			// destroy the surface
			jgraphics_surface_destroy(surface);
		}
	}
}

void bl_patch_capture_free(t_bl_patch_capture *x)
{
}


void *bl_patch_capture_new(t_symbol *s, long argc, t_atom *argv)
{
	t_bl_patch_capture *x = NULL;

	if (x = (t_bl_patch_capture *)object_alloc(bl_patch_capture_class)) {
		// init values
		// init rect values
		x->snip_x = 0;
		x->snip_y = 0;
		x->snip_width = 300;
		x->snip_height = 300;

		// init rect attribute
		x->attr_rect[0] = 0;
		x->attr_rect[1] = 0;
		x->attr_rect[2] = 300;
		x->attr_rect[3] = 300;

		// init dpi attribute
		x->attr_dpi = 300;

		// init name attribute and value
		x->attr_filename = gensym("bl.patch.capture.png");
		strcpy(x->filename, x->attr_filename->s_name);

		// process args
		attr_args_process(x, argc, argv);
	}
	return (x);
}

//setter for the "rect" attribute
t_max_err bl_patch_capture_setattr_rect(t_bl_patch_capture *x, void *attr, long ac, t_atom *av)
{
	if (ac && av) {
		long i;
		t_atom_long pict_x;
		t_atom_long pict_y;
		t_atom_long pict_width;
		t_atom_long pict_height;

		// type-check and low-clip rect values
		for (i = 0; i < ac; i++) {
			if ((av + i)->a_type == A_LONG) {
				if (i == 0) {
					pict_x = atom_getlong(av + i);
					if (pict_x < 0) {
						pict_x = 0;
					}
				}
				if (i == 1) {
					pict_y = atom_getlong(av + i);
					if (pict_y < 0) {
						pict_y = 0;
					}
				}
				if (i == 2) {
					pict_width = atom_getlong(av + i);
					if (pict_width < 1) {
						pict_width = 1;
					}
				}
				if (i == 3) {
					pict_height = atom_getlong(av + i);
					if (pict_height < 1) {
						pict_height = 1;
					}
				}
			}
		}

		// set attribute and values for rect
		if (ac >= 1) {
			x->attr_rect[0] = pict_x;
			x->snip_x = pict_x;
		}
		if (ac >= 2) {
			x->attr_rect[1] = pict_y;
			x->snip_y = pict_y;
		}
		if (ac >= 3) {
			x->attr_rect[2] = pict_width;
			x->snip_width = pict_width;
		}
		if (ac == 4) {
			x->attr_rect[3] = pict_height;
			x->snip_height = pict_height;
		}
	}
	return MAX_ERR_NONE;
}

//setter for "name" attribute
t_max_err bl_patch_capture_setattr_filename(t_bl_patch_capture *x, void *attr, long ac, t_atom *av)
{
	if (ac && av) {
		long i;
		t_symbol *name;
		for (i = 0; i < ac; i++) {
			if ((av + i)->a_type == A_SYM) {
				if (i == 0) {
					name = atom_getsym(av + i);
				}		
			}
		}

		x->attr_filename = name;
		strcpy(x->filename, name->s_name);

	}
	return MAX_ERR_NONE;
}