{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 196.0, 161.0, 642.0, 655.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 0,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"helpsidebarclosed" : 1,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 642.0, 629.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"id" : "obj-7",
									"linecount" : 20,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 111.0, 513.0, 298.0 ],
									"text" : "1. The object will only try to interpolate if a keyname from the left input dictionary can be found in the right input dictionary. Non-matching keys will be ignored.\n\n2. If the type of the data at a given key is different in the two input dictionaries (eg. in the left one it is a number, but in the right one it is a symbol or an array), the object will throw an error and ignore that key.\n\n3. Integers will be converted to and output as floats.\n\n4. The entries of sublevel dictionaries will not be interpolated, just passed through.\n\n5. If the value of a given key is a symbol or a dictionary, these will only be output when the ratio is either 0 or 1. Thus sending redundant duplicate messages is avoided.\n\n6. If the value of a given key is an array, that array can only contain integers, floats and symols. Integers and floats inside the array will be interpolated (in the same manor), but symbols will only be copied from the left input dictionary, until the ratio is 1, when they will be copied from the right input dictionary. Thus the length of the input arrays are preserved throughout the interpolation.",
									"textcolor" : [ 0.423529411764706, 0.423529411764706, 0.423529411764706, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"id" : "obj-5",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 88.0, 337.0, 21.0 ],
									"text" : "Some info about how the interpolation is implemented"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"fontsize" : 53.16274537497975,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 9.550287227760165, 479.0, 71.0 ],
									"text" : "bl.dict.interpolate"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 19.0, 126.0, 45.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p rules"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 642.0, 629.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 2,
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 375.0, 468.0, 252.0, 39.0 ],
									"text" : "Take a look at the contents via the text editor"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 72.0, 438.0, 186.0, 22.0 ],
									"text" : "loadmess dictionary myoutputdict"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 451.5, 513.0, 99.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict myoutputdict"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "dict.view",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 72.0, 468.0, 292.0, 146.0 ]
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-1",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 371.0, 353.5, 139.0, 37.0 ],
									"text" : "@dictoutput 1 @name myoutputdict"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 56.400000000000006, 232.0, 96.0, 24.0 ],
									"text" : "2) Interpolate"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 157.0, 264.5, 112.0, 24.0 ],
									"text" : "1) Bind to inputs"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 128.400000000000006, 264.5, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-54",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 316.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-52",
									"maxclass" : "dial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 224.0, 40.0, 40.0 ],
									"size" : 1.0
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 230.0, 316.0, 50.5, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict to"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 72.0, 316.0, 55.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict from"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "dictionary" ],
									"patching_rect" : [ 72.0, 361.0, 294.0, 22.0 ],
									"text" : "bl.dict.interpolate @dictoutput 1 @name myoutputdict"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"id" : "obj-7",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 111.0, 510.0, 50.0 ],
									"text" : "In dictionary output mode, you can set the name of the output dictionary, so you can reference it in other dictionary-related objects. This feature is only allowed when @dictoutput is set to 1.",
									"textcolor" : [ 0.423529411764706, 0.423529411764706, 0.423529411764706, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"id" : "obj-5",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 88.0, 302.0, 21.0 ],
									"text" : "Provide a custom name for the output dictionary"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"fontsize" : 53.16274537497975,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 9.550287227760165, 479.0, 71.0 ],
									"text" : "bl.dict.interpolate"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"order" : 0,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"order" : 1,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 19.0, 86.0, 49.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p name"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 26.0, 642.0, 629.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 72.0, 406.0, 47.0, 22.0 ],
									"text" : "dict.iter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "dict.view",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 406.0, 439.0, 222.0, 147.0 ]
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-1",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 255.0, 360.0, 100.0, 24.0 ],
									"text" : "@dictoutput 1"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 56.400000000000006, 232.0, 96.0, 24.0 ],
									"text" : "2) Interpolate"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 157.0, 264.5, 112.0, 24.0 ],
									"text" : "1) Bind to inputs"
								}

							}
, 							{
								"box" : 								{
									"dontreplace" : 1,
									"id" : "obj-64",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 206.600000000000023, 592.0, 110.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "dict.view",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 241.199999999999989, 563.0, 110.0, 22.5 ]
								}

							}
, 							{
								"box" : 								{
									"dontreplace" : 1,
									"id" : "obj-61",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 72.199999999999989, 592.0, 131.600000000000023, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-59",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 128.400000000000006, 563.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 6,
									"outlettype" : [ "", "", "", "", "", "" ],
									"patching_rect" : [ 72.0, 439.0, 301.0, 22.0 ],
									"text" : "route multislider myfloat mystring mydict mymixedarray"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 128.400000000000006, 264.5, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-54",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 316.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-52",
									"maxclass" : "dial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 224.0, 40.0, 40.0 ],
									"size" : 1.0
								}

							}
, 							{
								"box" : 								{
									"candycane" : 23,
									"id" : "obj-51",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 72.0, 470.5, 298.0, 79.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"setstyle" : 1,
									"size" : 128
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 230.0, 316.0, 50.5, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict to"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 72.0, 316.0, 55.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict from"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "dictionary" ],
									"patching_rect" : [ 72.0, 361.0, 177.0, 22.0 ],
									"text" : "bl.dict.interpolate @dictoutput 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"id" : "obj-7",
									"linecount" : 6,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 111.0, 510.0, 94.0 ],
									"text" : "If you enable the dictionary output mode, the interpolation will be sent out as a dictionary. This mode can be useful if the input dictionaries have a lot of entries, as in normal mode the interpolation would result in possibly thousands of output messages, possibly cluttering Max's scheduler. In dictionary output mode, the output will be a single message (a dictionary), even if your input dictionaries have hundreds of entries.",
									"textcolor" : [ 0.423529411764706, 0.423529411764706, 0.423529411764706, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"id" : "obj-5",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 88.0, 247.0, 21.0 ],
									"text" : "Output the interpolation as a dictionary"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"fontsize" : 53.16274537497975,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 9.550287227760165, 479.0, 71.0 ],
									"text" : "bl.dict.interpolate"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"order" : 0,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"order" : 1,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-57", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-61", 1 ],
									"source" : [ "obj-57", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-57", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 1 ],
									"source" : [ "obj-57", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"order" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"order" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 19.0, 50.0, 71.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p dictoutput"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 196.0, 187.0, 642.0, 629.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-4",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 55.0, 206.0, 328.0, 37.0 ],
									"text" : "2) After you provided the input dictionaries, you can trigger the interpolation by sending the ratio to the object."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-2",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 159.0, 258.0, 357.0, 37.0 ],
									"text" : "1) Bind the two dictionaries to the object. You only have to do this once, or after you change the name of an input dictionary."
								}

							}
, 							{
								"box" : 								{
									"dontreplace" : 1,
									"id" : "obj-64",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 206.600000000000023, 544.0, 110.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "dict.view",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 241.199999999999989, 515.0, 110.0, 22.5 ]
								}

							}
, 							{
								"box" : 								{
									"dontreplace" : 1,
									"id" : "obj-61",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 72.199999999999989, 544.0, 131.600000000000023, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-59",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 128.400000000000006, 515.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 6,
									"outlettype" : [ "", "", "", "", "", "" ],
									"patching_rect" : [ 72.0, 391.0, 301.0, 22.0 ],
									"text" : "route multislider myfloat mystring mydict mymixedarray"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 128.400000000000006, 264.5, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-54",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 316.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"floatoutput" : 1,
									"id" : "obj-52",
									"maxclass" : "dial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 206.0, 40.0, 40.0 ],
									"size" : 1.0
								}

							}
, 							{
								"box" : 								{
									"candycane" : 23,
									"id" : "obj-51",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 72.0, 422.5, 298.0, 79.0 ],
									"setminmax" : [ 0.0, 1.0 ],
									"setstyle" : 1,
									"size" : 128
								}

							}
, 							{
								"box" : 								{
									"data" : 									{
										"multislider" : [ 1.0, 0.990392625331879, 0.961939752101898, 0.915734767913818, 0.853553414344788, 0.777785122394562, 0.691341698169708, 0.597545146942139, 0.5, 0.402454853057861, 0.308658301830292, 0.222214877605438, 0.146446615457535, 0.084265202283859, 0.038060247898102, 0.009607374668121, 0.0, 0.009607374668121, 0.038060247898102, 0.084265202283859, 0.146446615457535, 0.222214877605438, 0.308658301830292, 0.402454853057861, 0.5, 0.597545146942139, 0.691341698169708, 0.777785122394562, 0.853553414344788, 0.915734767913818, 0.961939752101898, 0.990392625331879, 1.0, 0.990392625331879, 0.961939752101898, 0.915734767913818, 0.853553414344788, 0.777785122394562, 0.691341698169708, 0.597545146942139, 0.5, 0.402454853057861, 0.308658301830292, 0.222214877605438, 0.146446615457535, 0.084265202283859, 0.038060247898102, 0.009607374668121, 0.0, 0.009607374668121, 0.038060247898102, 0.084265202283859, 0.146446615457535, 0.222214877605438, 0.308658301830292, 0.402454853057861, 0.5, 0.597545146942139, 0.691341698169708, 0.777785122394562, 0.853553414344788, 0.915734767913818, 0.961939752101898, 0.990392625331879, 1.0, 0.990392625331879, 0.961939752101898, 0.915734767913818, 0.853553414344788, 0.777785122394562, 0.691341698169708, 0.597545146942139, 0.5, 0.402454853057861, 0.308658301830292, 0.222214877605438, 0.146446615457535, 0.084265202283859, 0.038060247898102, 0.009607374668121, 0.0, 0.009607374668121, 0.038060247898102, 0.084265202283859, 0.146446615457535, 0.222214877605438, 0.308658301830292, 0.402454853057861, 0.5, 0.597545146942139, 0.691341698169708, 0.777785122394562, 0.853553414344788, 0.915734767913818, 0.961939752101898, 0.990392625331879, 1.0, 0.990392625331879, 0.961939752101898, 0.915734767913818, 0.853553414344788, 0.777785122394562, 0.691341698169708, 0.597545146942139, 0.5, 0.402454853057861, 0.308658301830292, 0.222214877605438, 0.146446615457535, 0.084265202283859, 0.038060247898102, 0.009607374668121, 0.0, 0.009607374668121, 0.038060247898102, 0.084265202283859, 0.146446615457535, 0.222214877605438, 0.308658301830292, 0.402454853057861, 0.5, 0.597545146942139, 0.691341698169708, 0.777785122394562, 0.853553414344788, 0.915734767913818, 0.961939752101898, 0.990392625331879 ],
										"myfloat" : 10.0,
										"mystring" : "how are you today?",
										"mydict" : 										{
											"this" : "is dict B!"
										}
,
										"mymixedarray" : [ "five", 6, 7, "eight" ]
									}
,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 206.0, 316.0, 103.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 1,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict to @embed 1"
								}

							}
, 							{
								"box" : 								{
									"data" : 									{
										"multislider" : [ 0.5, 0.524533867835999, 0.549008548259735, 0.573365211486816, 0.597545146942139, 0.621490120887756, 0.645142316818237, 0.668444931507111, 0.691341698169708, 0.713777542114258, 0.735698342323303, 0.757051348686218, 0.777785122394562, 0.797849655151367, 0.817196607589722, 0.8357794880867, 0.853553414344788, 0.87047553062439, 0.886505246162415, 0.901603758335114, 0.915734767913818, 0.928864300251007, 0.940960645675659, 0.951994657516479, 0.961939752101898, 0.97077202796936, 0.978470206260681, 0.985015630722046, 0.990392625331879, 0.994588255882263, 0.997592329978943, 0.999397754669189, 1.0, 0.999397754669189, 0.997592329978943, 0.994588255882263, 0.990392625331879, 0.985015630722046, 0.978470206260681, 0.97077202796936, 0.961939752101898, 0.951994657516479, 0.940960645675659, 0.928864300251007, 0.915734767913818, 0.901603758335114, 0.886505246162415, 0.87047553062439, 0.853553414344788, 0.8357794880867, 0.817196607589722, 0.797849655151367, 0.777785122394562, 0.757051348686218, 0.735698342323303, 0.713777542114258, 0.691341698169708, 0.668444931507111, 0.645142316818237, 0.621490120887756, 0.597545146942139, 0.573365211486816, 0.549008548259735, 0.524533867835999, 0.5, 0.475466161966324, 0.450991421937943, 0.426634758710861, 0.402454853057861, 0.378509908914566, 0.354857683181763, 0.331555068492889, 0.308658301830292, 0.286222457885742, 0.264301627874374, 0.242948621511459, 0.222214877605438, 0.202150344848633, 0.182803362607956, 0.1642205119133, 0.146446615457535, 0.129524439573288, 0.113494783639908, 0.098396241664886, 0.084265202283859, 0.071135699748993, 0.059039354324341, 0.048005342483521, 0.038060247898102, 0.02922797203064, 0.021529823541641, 0.014984369277954, 0.009607374668121, 0.005411744117737, 0.002407640218735, 0.000602275133133, 0.0, 0.000602275133133, 0.002407640218735, 0.005411744117737, 0.009607374668121, 0.014984369277954, 0.021529823541641, 0.02922797203064, 0.038060247898102, 0.048005342483521, 0.059039354324341, 0.071135699748993, 0.084265202283859, 0.098396241664886, 0.113494783639908, 0.129524439573288, 0.146446615457535, 0.1642205119133, 0.182803362607956, 0.202150344848633, 0.222214877605438, 0.242948621511459, 0.264301627874374, 0.286222457885742, 0.308658301830292, 0.331555068492889, 0.354857683181763, 0.378509908914566, 0.402454853057861, 0.426634758710861, 0.450991421937943, 0.475466161966324 ],
										"myfloat" : -10.0,
										"mystring" : "hey there!",
										"mydict" : 										{
											"this" : "is dict A!"
										}
,
										"mymixedarray" : [ "one", 2, 3, "four" ],
										"unique" : "this will be ignored"
									}
,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 72.0, 316.0, 117.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 1,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict from @embed 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 72.0, 361.0, 99.0, 22.0 ],
									"text" : "bl.dict.interpolate"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"id" : "obj-7",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 111.0, 510.0, 65.0 ],
									"text" : "Given two dictionaries which have identical keynames with the same type of value data, the object interpolates between the stored values based on the ratio, given as a float ranging from 0 to 1, where 0 represents the dictionary in the left input, and 1 represents the dictionary in the right input.",
									"textcolor" : [ 0.423529411764706, 0.423529411764706, 0.423529411764706, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"id" : "obj-5",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 88.0, 230.0, 21.0 ],
									"text" : "Interpolate between two dictionaries"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Ableton Sans",
									"fontsize" : 53.16274537497975,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 9.550287227760165, 479.0, 71.0 ],
									"text" : "bl.dict.interpolate"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"order" : 0,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"order" : 1,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-57", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-61", 1 ],
									"source" : [ "obj-57", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-57", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 1 ],
									"source" : [ "obj-57", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 19.0, 15.0, 47.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p basic"
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [ 			{
				"name" : "bl.dict.interpolate.mxe64",
				"type" : "mx64"
			}
 ],
		"autosave" : 0
	}

}
