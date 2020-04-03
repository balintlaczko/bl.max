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
		"rect" : [ 34.0, 77.0, 1532.0, 749.0 ],
		"openrect" : [ 0.0, 0.0, 265.0, 30.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
		"enablehscroll" : 0,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-141",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 403.333333333333258, 682.0, 129.0, 22.0 ],
					"text" : "s #0_running_range"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-140",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 371.833333333333258, 651.0, 50.5, 22.0 ],
					"text" : "t l l l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-138",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 371.833333333333258, 617.0, 136.0, 22.0 ],
					"text" : "jstrigger ([a[0]\\, a[0] + 1])"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 423.0, 521.0, 128.0, 22.0 ],
					"text" : "s #0_outgate_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-121",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 388.833333333333258, 581.0, 147.0, 22.0 ],
					"text" : "s #0_output_clip_range"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 405.833333333333258, 549.0, 174.0, 22.0 ],
					"text" : "s #0_range_detection_mode"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 354.833333333333258, 830.0, 91.0, 22.0 ],
					"text" : "s #0_to_num"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-124",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 354.833333333333258, 802.0, 45.0, 22.0 ],
					"text" : "min $1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 371.833333333333258, 770.0, 138.0, 22.0 ],
					"text" : "s #0_to_num_inrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-126",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 382.333333333333258, 736.0, 143.0, 22.0 ],
					"text" : "s #0_to_slider_inrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 392.833333333333258, 709.0, 151.0, 22.0 ],
					"text" : "s #0_to_slider_outrange"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-128",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "int", "int" ],
					"patching_rect" : [ 354.833333333333258, 494.0, 87.0, 22.0 ],
					"text" : "t l l l 2 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 147.0, 947.0, 126.0, 22.0 ],
					"text" : "r #0_outgate_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-118",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 164.0, 521.0, 128.0, 22.0 ],
					"text" : "s #0_outgate_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 347.333333333333485, 975.0, 145.0, 22.0 ],
					"text" : "r #0_output_clip_range"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-100",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 337.0, 1002.0, 51.0, 22.0 ],
					"text" : "unjoin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-101",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 321.0, 1031.0, 51.0, 22.0 ],
					"text" : "clip"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 234.0, 1065.0, 157.0, 22.0 ],
					"text" : "if $f1 < $f2 then $f2 else $f1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 147.0, 975.0, 193.0, 22.0 ],
					"text" : "gate 3 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 143.0, 581.0, 147.0, 22.0 ],
					"text" : "s #0_output_clip_range"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 153.5, 549.0, 174.0, 22.0 ],
					"text" : "s #0_range_detection_mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 631.5, 432.0, 172.0, 22.0 ],
					"text" : "r #0_range_detection_mode"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-94",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 97.833333333333258, 754.0, 91.0, 22.0 ],
					"text" : "s #0_to_num"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 97.833333333333258, 718.0, 91.0, 22.0 ],
					"text" : "min $1, max $2"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 111.5, 681.0, 138.0, 22.0 ],
					"text" : "s #0_to_num_inrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 122.0, 646.0, 143.0, 22.0 ],
					"text" : "s #0_to_slider_inrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 132.5, 612.0, 151.0, 22.0 ],
					"text" : "s #0_to_slider_outrange"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "", "", "", "", "", "int", "int" ],
					"patching_rect" : [ 101.0, 494.0, 82.0, 22.0 ],
					"text" : "t l l l l l 0 3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 66.0, 457.0, 19.0, 20.0 ],
					"text" : "2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 163.0, 459.0, 41.0, 20.0 ],
					"text" : "only 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 101.0, 457.0, 52.0, 22.0 ],
					"text" : "gate 2 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 171.5, 419.0, 29.5, 22.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 134.0, 333.0, 56.5, 22.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 171.5, 390.0, 33.0, 22.0 ],
					"text" : "== 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 171.5, 362.0, 37.0, 22.0 ],
					"text" : "zl len"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 243.75, 291.0, 55.0, 22.0 ],
					"text" : "zl ecils 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 134.0, 291.0, 98.0, 22.0 ],
					"text" : "bl.autobp 261 23"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 6,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patching_rect" : [ 15.599999999999994, 48.0, 829.499999999999886, 22.0 ],
					"text" : "route bang int float reset set"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 822.5, 1043.0, 101.0, 22.0 ],
					"text" : "s #0_to_output"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 361.833333333333258, 1097.0, 99.0, 22.0 ],
					"text" : "r #0_to_output"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 697.0, 1139.0, 101.0, 22.0 ],
					"text" : "s #0_to_output"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 654.0, 1109.0, 62.0, 22.0 ],
					"text" : "t f f f"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.75, 198.0, 129.0, 22.0 ],
					"text" : "s #0_running_range"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 654.0, 466.0, 127.0, 22.0 ],
					"text" : "r #0_running_range"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 675.5, 1170.0, 129.0, 22.0 ],
					"text" : "s #0_running_range"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 654.0, 1379.0, 97.0, 22.0 ],
					"text" : "s #0_to_slider"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.599999999999994, 87.0, 97.0, 22.0 ],
					"text" : "s #0_to_slider"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 718.5, 1289.0, 119.0, 22.0 ],
					"text" : "r #0_running_max"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 757.0, 953.0, 119.0, 22.0 ],
					"text" : "r #0_running_max"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 708.5, 1262.0, 115.0, 22.0 ],
					"text" : "r #0_running_min"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 742.0, 926.0, 115.0, 22.0 ],
					"text" : "r #0_running_min"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 720.0, 733.0, 119.0, 22.0 ],
					"text" : "r #0_running_max"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 753.0, 600.0, 121.0, 22.0 ],
					"text" : "s #0_running_max"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 708.200000000000045, 700.0, 115.0, 22.0 ],
					"text" : "r #0_running_min"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.709803921568627, 0.196078431372549, 1.0 ],
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 631.5, 600.0, 117.0, 22.0 ],
					"text" : "s #0_running_min"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 672.0, 1203.0, 136.0, 22.0 ],
					"text" : "r #0_to_num_inrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 620.300000000000068, 275.0, 138.0, 22.0 ],
					"text" : "s #0_to_num_inrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 708.0, 865.0, 149.0, 22.0 ],
					"text" : "r #0_to_slider_outrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 638.000000000000114, 243.0, 151.0, 22.0 ],
					"text" : "s #0_to_slider_outrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 672.0, 638.0, 141.0, 22.0 ],
					"text" : "r #0_to_slider_inrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 646.000000000000114, 207.0, 143.0, 22.0 ],
					"text" : "s #0_to_slider_inrange"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 177.699999999999989, 230.0, 91.0, 22.0 ],
					"text" : "s #0_to_num"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 516.900000000000091, 202.0, 91.0, 22.0 ],
					"text" : "s #0_to_num"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 708.200000000000045, 786.0, 95.0, 22.0 ],
					"text" : "r #0_to_slider"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.082352941176471, 0.996078431372549, 1.0 ],
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 501.899999999999977, 229.0, 97.0, 22.0 ],
					"text" : "s #0_to_slider"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 702.5, 1043.0, 89.0, 22.0 ],
					"text" : "r #0_to_num"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 797.900000000000091, 207.0, 91.0, 22.0 ],
					"text" : "s #0_to_num"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 501.899999999999977, 175.0, 41.0, 22.0 ],
					"text" : "set $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 620.300000000000068, 175.0, 29.5, 22.0 ],
					"text" : "0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "int", "bang", "bang", "float", "float", "bang" ],
					"patching_rect" : [ 501.899999999999977, 145.0, 315.000000000000114, 22.0 ],
					"text" : "t 0 b b 0. 1. b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 797.900000000000091, 175.0, 57.0, 22.0 ],
					"text" : "min, max"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 654.0, 1043.0, 41.0, 22.0 ],
					"text" : "set $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 654.0, 1011.0, 187.5, 22.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 654.0, 496.0, 29.5, 22.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "float", "int", "int" ],
					"patching_rect" : [ 709.700000000000045, 569.0, 48.0, 22.0 ],
					"text" : "peak 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "float", "int", "int" ],
					"patching_rect" : [ 631.5, 569.0, 67.0, 22.0 ],
					"text" : "Trough 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 631.5, 525.0, 52.0, 22.0 ],
					"text" : "gate 2 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 177.699999999999989, 198.0, 41.0, 22.0 ],
					"text" : "set $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 654.0, 786.0, 41.0, 22.0 ],
					"text" : "set $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 177.699999999999989, 145.0, 31.0, 22.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 177.699999999999989, 87.0, 162.300000000000011, 22.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 708.0, 893.0, 55.0, 22.0 ],
					"text" : "unjoin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 654.0, 983.0, 91.0, 22.0 ],
					"text" : "zmap 0. 1. 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 672.0, 1231.0, 55.0, 22.0 ],
					"text" : "unjoin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 654.0, 1319.0, 91.0, 22.0 ],
					"text" : "zmap 0. 1. 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 672.0, 666.0, 55.0, 22.0 ],
					"text" : "unjoin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 654.0, 761.0, 91.0, 22.0 ],
					"text" : "zmap 0. 1. 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 243.75, 260.0, 72.0, 22.0 ],
					"text" : "patcherargs"
				}

			}
, 			{
				"box" : 				{
					"comment" : "int, float, bang, reset",
					"id" : "obj-12",
					"index" : 1,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.599999999999994, 13.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "float",
					"id" : "obj-11",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 321.0, 1133.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 654.0, 1348.0, 41.0, 22.0 ],
					"text" : "set $1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-4",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 654.0, 1078.0, 58.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 58.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-2",
					"knobcolor" : [ 0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 654.0, 822.0, 201.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 59.0, 0.0, 201.0, 22.0 ],
					"size" : 1.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 1,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"order" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 2 ],
					"source" : [ "obj-100", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 1 ],
					"order" : 1,
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 1 ],
					"order" : 0,
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"source" : [ "obj-103", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"source" : [ "obj-103", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 0 ],
					"source" : [ "obj-128", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"source" : [ "obj-128", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"source" : [ "obj-128", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-124", 0 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-138", 0 ],
					"source" : [ "obj-128", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 2 ],
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"source" : [ "obj-140", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-140", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"source" : [ "obj-140", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 2 ],
					"source" : [ "obj-16", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 1 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 4 ],
					"source" : [ "obj-18", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 3 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"order" : 1,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-24", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"order" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 1 ],
					"source" : [ "obj-34", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"order" : 1,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"order" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-40", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-40", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-40", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-40", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-46", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 1 ],
					"source" : [ "obj-46", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 1 ],
					"source" : [ "obj-46", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"source" : [ "obj-46", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-46", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"order" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"order" : 1,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"order" : 2,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 2 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 1 ],
					"source" : [ "obj-6", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 3 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 1 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 4 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 2 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-70", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 1 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-79", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"source" : [ "obj-79", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-86", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"source" : [ "obj-90", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"source" : [ "obj-90", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"source" : [ "obj-90", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"source" : [ "obj-90", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"source" : [ "obj-90", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"source" : [ "obj-90", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
 ]
	}

}
