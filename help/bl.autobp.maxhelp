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
		"rect" : [ 100.0, 100.0, 539.0, 604.0 ],
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
					"id" : "obj-6",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 88.5, 306.0, 353.0, 34.0 ],
					"text" : "In the bl package several abstractions rely on bl.autobp, such as bl.slider, bl.snap.seq or bl.3dviewer."
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubblepoint" : 1.0,
					"bubbleside" : 0,
					"id" : "obj-3",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 222.0, 239.5, 67.0 ],
					"text" : "left in an abstraction this would create a 200px * 200px bpatcher loaded with that abstraction every time it is created "
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 3,
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 229.0, 464.5, 87.0, 24.0 ],
					"text" : "bl.snap.seq"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 146.0, 522.5, 86.0, 24.0 ],
					"text" : "bl.3dviewer"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 103.0, 379.0, 52.0, 39.0 ],
					"text" : "bl.slider"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 220.0, 198.0, 105.0, 22.0 ],
					"text" : "bl.autobp 200 200"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubblepoint" : 0.07,
					"fontname" : "Ableton Sans",
					"id" : "obj-10",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 327.0, 198.0, 132.0, 54.0 ],
					"text" : "args:\n#1: bpatcher width\n#2: bpatcher height"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans",
					"id" : "obj-7",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 111.0, 510.0, 64.0 ],
					"text" : "The abstraction automatically creates a bpatcher with a specified width and height from an abstraction. To use it, simply drop it somewhere in the abstraction you want to use as a bpatcher. In case there are arguments defined for the abstraction bl.autobp fetches these and passes them through its outlet in the created bpatcher (like a patcherargs object).",
					"textcolor" : [ 0.423529411764706, 0.423529411764706, 0.423529411764706, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans",
					"id" : "obj-12",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 88.0, 205.0, 21.0 ],
					"text" : "Convert abstractions into bpatchers"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Ableton Sans",
					"fontsize" : 53.16274537497975,
					"id" : "obj-13",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 9.550287227760165, 238.0, 70.0 ],
					"text" : "bl.autobp"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "bpat" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-5",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "bl.slider.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 10.0, 354.0, 261.0, 23.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "bpat" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-17",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "bl.snap.seq.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 318.0, 361.0, 202.0, 231.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "bpat" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-20",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "bl.3dviewer.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 10.0, 477.0, 134.0, 115.0 ],
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-20::obj-21" : [ "live.text[19]", "live.text", 0 ],
			"obj-20::obj-6" : [ "live.text[22]", "live.text", 0 ],
			"obj-17::obj-144" : [ "live.text[9]", "live.text", 0 ],
			"obj-17::obj-138" : [ "live.text[10]", "live.text", 0 ],
			"obj-17::obj-143" : [ "live.text[14]", "live.text", 0 ],
			"obj-20::obj-83" : [ "live.text[21]", "live.text", 0 ],
			"obj-20::obj-77" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-17::obj-132" : [ "number[5]", "number", 0 ],
			"obj-20::obj-17" : [ "live.text[17]", "live.text", 0 ],
			"obj-17::obj-134" : [ "live.text[15]", "live.text", 0 ],
			"obj-17::obj-128" : [ "number[4]", "number[2]", 0 ],
			"obj-17::obj-131" : [ "live.text[12]", "live.text", 0 ],
			"obj-20::obj-66" : [ "live.text[18]", "live.text", 0 ],
			"obj-17::obj-139" : [ "live.text[11]", "live.text", 0 ],
			"obj-20::obj-10" : [ "live.text[23]", "live.text", 0 ],
			"obj-17::obj-130" : [ "number[3]", "number[1]", 0 ],
			"obj-17::obj-133" : [ "live.text[13]", "live.text", 0 ],
			"obj-20::obj-7" : [ "live.text[16]", "live.text", 0 ],
			"obj-20::obj-5" : [ "live.text[20]", "live.text", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-20::obj-21" : 				{
					"parameter_longname" : "live.text[19]"
				}
,
				"obj-20::obj-6" : 				{
					"parameter_longname" : "live.text[22]"
				}
,
				"obj-17::obj-144" : 				{
					"parameter_longname" : "live.text[9]"
				}
,
				"obj-17::obj-138" : 				{
					"parameter_longname" : "live.text[10]"
				}
,
				"obj-17::obj-143" : 				{
					"parameter_longname" : "live.text[14]"
				}
,
				"obj-20::obj-83" : 				{
					"parameter_longname" : "live.text[21]"
				}
,
				"obj-20::obj-77" : 				{
					"parameter_longname" : "live.numbox[1]"
				}
,
				"obj-20::obj-17" : 				{
					"parameter_longname" : "live.text[17]"
				}
,
				"obj-17::obj-134" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-17::obj-131" : 				{
					"parameter_longname" : "live.text[12]"
				}
,
				"obj-20::obj-66" : 				{
					"parameter_longname" : "live.text[18]"
				}
,
				"obj-17::obj-139" : 				{
					"parameter_longname" : "live.text[11]"
				}
,
				"obj-20::obj-10" : 				{
					"parameter_longname" : "live.text[23]"
				}
,
				"obj-17::obj-133" : 				{
					"parameter_longname" : "live.text[13]"
				}
,
				"obj-20::obj-7" : 				{
					"parameter_longname" : "live.text[16]"
				}
,
				"obj-20::obj-5" : 				{
					"parameter_longname" : "live.text[20]"
				}

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "bl.3dviewer.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "poly-sourceLabels.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers/utility",
				"patcherrelativepath" : "../patchers/utility",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "poly-speakerLabels.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers/utility",
				"patcherrelativepath" : "../patchers/utility",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "bl.autobp.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "makeIntoBp.js",
				"bootpath" : "~/Documents/Max 8/Packages/bl/javascript",
				"patcherrelativepath" : "../javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "bl.snap.seq.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "snapSeq.js",
				"bootpath" : "~/Documents/Max 8/Packages/bl/javascript",
				"patcherrelativepath" : "../javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "ease.chooser.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/ease/patchers",
				"patcherrelativepath" : "../../ease/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "bl.slider.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/bl/patchers",
				"patcherrelativepath" : "../patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "spat5.knn.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "spat5.osc.route.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "spat5.converter.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "spat5.osc.unslashify.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "spat5.transform.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "spat5.osc.routepass.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "spat5.osc.change.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "ease.mxe64",
				"type" : "mx64"
			}
 ],
		"autosave" : 0
	}

}
