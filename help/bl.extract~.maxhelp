{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 662.0, 584.0 ],
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
		"toolbarvisible" : 1,
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
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 139.0, 175.0, 70.0, 22.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans",
					"id" : "obj-7",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 111.0, 517.0, 50.0 ],
					"text" : "The abstraction splits the incoming audio into an arbitrary number of perceptually equal-width frequency bands and outputs a chosen one. It is basically a timesaver combination of a bl.split~ and an bl.mc.channel~.",
					"textcolor" : [ 0.423529411764706, 0.423529411764706, 0.423529411764706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans",
					"id" : "obj-15",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 88.0, 188.0, 21.0 ],
					"text" : "Extract part of a frequency range"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans",
					"fontsize" : 53.16274537497975,
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 9.550287227760165, 273.0, 70.0 ],
					"text" : "bl.extract~"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Ableton Sans",
					"id" : "obj-17",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 331.0, 259.0, 252.0, 68.0 ],
					"text" : "args:\n#1: number of FFT-bands to split the input\n#2: default chosen band\n#3: FFT window size"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 10.0, 175.0, 119.0, 22.0 ],
					"text" : "metro 500 @active 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 10.0, 207.0, 85.0, 22.0 ],
					"text" : "counter 2 1 30"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 139.0, 379.0, 48.0, 136.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 0,
							"parameter_unitstyle" : 4,
							"parameter_mmin" : -70.0,
							"parameter_longname" : "Extracted",
							"parameter_mmax" : 6.0,
							"parameter_shortname" : "Extracted"
						}

					}
,
					"varname" : "Extracted"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"logfreq" : 1,
					"maxclass" : "spectroscope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 196.0, 379.0, 300.0, 100.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 241.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"data" : 					{
						"clips" : [ 							{
								"absolutepath" : "cherokee.aif",
								"filename" : "cherokee.aif",
								"filekind" : "audiofile",
								"selection" : [ 0.0, 1.0 ],
								"loop" : 1,
								"content_state" : 								{
									"timestretch" : [ 0 ],
									"formantcorrection" : [ 0 ],
									"pitchshift" : [ 1.0 ],
									"originallength" : [ 0.0, "ticks" ],
									"speed" : [ 1.0 ],
									"slurtime" : [ 0.0 ],
									"originaltempo" : [ 120.0 ],
									"quality" : [ "basic" ],
									"basictuning" : [ 440 ],
									"formant" : [ 1.0 ],
									"mode" : [ "basic" ],
									"pitchcorrection" : [ 0 ],
									"followglobaltempo" : [ 0 ],
									"originallengthms" : [ 0.0 ],
									"play" : [ 0 ]
								}

							}
 ]
					}
,
					"id" : "obj-6",
					"maxclass" : "playlist~",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "signal", "", "dictionary" ],
					"patching_rect" : [ 139.0, 207.0, 150.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 139.0, 529.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 139.0, 282.0, 187.0, 22.0 ],
					"text" : "bl.extract~ 30 15 1024 @ramp 10"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"order" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"order" : 1,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"order" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-11" : [ "Extracted", "Extracted", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "bl.extract~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "bl.split~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "splitIntoManyExp.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers/utility",
				"patcherrelativepath" : "../patchers/utility",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "calcBands.gendsp",
				"bootpath" : "~/Documents/Max 8/Library/gendsp",
				"patcherrelativepath" : "../../../Library/gendsp",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "bl.genlist.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "bl.mc.channel~.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "cherokee.aif",
				"bootpath" : "C74:/media/msp",
				"type" : "AIFF",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
