# Welcome to the bl package!

I am Bálint Laczkó, composer, developer, and Max-freak. This package consists of (mostly) abstractions I have been developing for my creative work or just for fun. Some of them are just simple timesavers, some of them caused some serious head-scratching... :) I hope they can be of use in your work as well!

The toolbox is constantly growing, so it might be worth to check the repo every once in a while.

If you have questions, requests, or you want to make a bug report, just open a new Issue on this repository. That would be a great help for me to improve this package. I welcome pull requests as well!

Some of the abstractions need the Spat5 (IRCAM) package to work. You can download it [here](https://forum.ircam.fr/projects/detail/spat/)! (I am not affiliated with IRCAM, just a happy user.)

bl.snap.seq needs the Ease packace, you can download it from the Package Manager!

Happy patching!

## Table of contents
- [bl.3dviewer](https://github.com/balintlaczko/bl.max/tree/master#bl3dviewer)
- [bl.autobp](https://github.com/balintlaczko/bl.max/tree/master#blautobp)
- [bl.decode32](https://github.com/balintlaczko/bl.max/tree/master#bldecode32)
- [bl.dict.interpolate](https://github.com/balintlaczko/bl.max/tree/master#bldictinterpolate)
- [bl.dict.isempty](https://github.com/balintlaczko/bl.max/tree/master#bldictisempty)
- [bl.directivity.shaper~](https://github.com/balintlaczko/bl.max/tree/master#bldirectivityshaper)

### bl.3dviewer
#### 3-dimensional viewer for spat5.viewer or spat5.oper
Interprets messages from a connected spat5.viewer or spat5.oper object and visualizes the sources and speakers in a 3D scene.

Usage:
1) Connect the left-most and the dump outlet of your oper or viewer to bl.3dviewer.
2) /dump the oper or viewer so the 3dviewer fetches the positions and colors of your speakers & sources. (Later on, if you change the number, color, label or visibility of a speaker or a source, you have to /dump again, since the oper/viewer doesn't output these values automatically when changed.) 
Speaker#1 is always red.
3) Switch on "render" on the bl.3dviewer UI.
4) Drag the handle in the middle to rotate the image; clicking on "reset" or double-clicking anywhere (but the handle in the middle) on the spat3D window also resets the view to default position/orientation. Alt/Option + click&drag zooms, Cmd/Ctrl + click&drag repositions the image.
5) Use WSAD keys to move around, and Q & Z to ascend/descend.


### bl.autobp
#### Convert abstractions into bpatchers
Automatically creates a bpatcher with a specified width and height from an abstraction. To use it, simply drop it somewhere in the abstraction you want to use as a bpatcher. In case there are arguments defined for the abstraction bl.autobp fetches these and passes them through its outlet in the created bpatcher (like a patcherargs object).

In the bl package several abstractions rely on bl.autobp, such as bl.slider, bl.snap.seq or [bl.3dviewer](https://github.com/balintlaczko/bl.max/tree/master#bl3dviewer).


### bl.decode32
#### Connect a 3D ambisonics encoder to a 2D decoder
Automatically connects the horizontal spherical harmonics of a selected 3D ambisonics encoder to a 2D decoder. Works in an unlocked patcher.

Usage:
1) Select the 3D encoder and the 2D decoder you want to connect.
2) Cmd/Ctrl + click on the button connected to bl.decode32 (while you are still in editing mode and the 2 objects remain selected).
3) Alternatively Cmd/Ctrl + click on a number (representing the HOA order) while the encoder and the decoder remain selected.


### bl.dict.interpolate
#### Interpolate between two dictionaries
Given two dictionaries which have identical keynames with the same type of value data, the object interpolates between the stored values based on the ratio, given as a float ranging from 0 to 1, where 0 represents the dictionary in the left input, and 1 represents the dictionary in the right input.


### bl.dict.isempty
#### Check if a dictionary is empty
Returns 1 if the dict is empty, and 0 if the dict is not empty. The dictionary can either be specified as an argument, or simply passed to the abstraction.


### bl.directivity.shaper~
#### Spatialize an audio spectrum
Splits the incoming audio into an arbitrary number of perceptually equal-width bands and encodes them as virtual sound sources in Higher-Order Ambisonics. The virtual sources can be positioned by interacting with the (wrapped-in) spat5.viewer.


### bl.extract~
#### Extract part of a frequency range
Splits the incoming audio into an arbitrary number of perceptually equal-width frequency bands and outputs a chosen one. It is basically a timesaver combination of a bl.split~ and an bl.mc.channel~.


### bl.folddegree
#### Fold any degree into the range of -180° to 180°
Expresses any degree with the equivalent one in the range of -180° to 180°.


### bl.genlist
#### Generate a list as a range of integers
Generates a list of integer numbers with the first argument being the bottom of the range and the second being the top. Both numbers are included in the list.


### bl.gest.capture
#### Capture anything as a gesture
This is a generic tool to sample any kind of data stream and output it as a coll, where the coll indices represent the elapsed time in milliseconds. This is done by a JS script, so the timing of the samples will not be as accurate as if it was a gen script, but for general purposes it is still pretty good. It can also come handy when we don't know the structure or type of the data beforehand, the object doesn't require that the number or type of the features remain the same throughout the recording ("anything goes").


### bl.gest.play~
#### Play back gestures from a polybuffer~ recorded by bl.gest.record~
This is the tool for playing back previously recorded gestures. After you switch on the device, you can lauch clips from the polybuffer~. The rate (default: 10 ms) will define the speed of the playback. If you play a sequence which was sampled at a 10 ms rate at the time of recording, choosing 10 ms rate results in speed=1 playback, 20 ms will be half-speed, etc.

You can use the donebang to for example launch another random clip from the polybuffer, perhaps with a different rate, etc.


### bl.gest.record~
#### Record gestures into a polybuffer~
This is the tool to record gestures with. After you switch on the device, it is listening to incoming arrays of features, and records them into a polybuffer~. If you stayed inactive for the amount of the "waittime" (ms) the device will think that the gesture is over, terminating the recording. If you want to build a large database of short gestures, use a short waittime, like 500 ms, if you would rather record longer phrases with intermittent pauses inside, choose a longer wittime, like 3000-4000 ms.

The benefit of recording gestures into audio buffers is that you can have better time precision, the possibility to record extremely long sequences, and use the synergy with some built-in Max objects, such as simple buffer~-based playback tools, such as play~, wave~ or groove~.


### bl.getrange
#### Get the range of a number stream
Keeps track of the running range of a number stream. The numbers can be passed as integers, floats or lists.


### bl.indexof
#### Get the index of an element in a list
Returns the 0-based index of a given element in a list (if the element can be found).


### bl.interp.xy~
#### Generate interpolating XY coordinates
Generates individually interpolating XY coordinates for an arbitrary number of instances (points). The interpolation time is randomly chosen for each point (at each new interpolation) between the minimum and maximum interpolation time.


### bl.keylatch
#### Toggle with pressing and releasing a key
Outputs 1 while a key is pressed down, and 0 when it is released. It is essentially a simple timesaver combination of key and keyup.


### bl.lim
#### Limit the rate of a data stream with gating
Similar to qlim or speedlim, with the difference that it drops (rather than postpones) every incoming message which arrives faster than the defined time interval (ms).


### bl.looper~
#### Generic click-free buffer playback tool
Can be in many ways considered to be similar to a groove~, with some enhancements in certain areas. It is notably better when it comes to "scrubbing", ie. changing the loop start- and end-points quickly and erratically. There is built-in option for fading around loop bounds, and there is also a quick fading mechanism to avoid clicks when scrubbing/jumping to another region of the buffer. 

Note: be careful with samplerates, this won't adapt to files having different SR from the current SR of the audio interface.


### bl.mc.channel~
#### Extract channel at an index from an mc signal
Passes through only one channel at the defined index (1-based) from an incoming mc.signal. You can define the chosen index dynamically by sending an integer to the left inlet.


### bl.mc.snapshot~
#### Take snapshot of an mc signal and output it as a list
Similar to snapshot~ or mc.snapshot~, but it outputs the values as a list.


### bl.p.bind
#### Bind the output of several patterns into a dictionary
Fetches the values of all connected patterns (bl.p.objects) and outputs a dictionary with the current value of each pattern. It can also act as a clock causing the output of connected patterns.


### bl.p.drunk
#### Step in a drunken walk in a pattern sequence
Generates an event stream where each consecutive output is a randomly chosen element (from the sequence defined as a list of arguments) within the distance from the last element defined by drunk step size. Similar to bl.p.rand.


### bl.p.rand
#### Step randomly in a pattern sequence
Generates an event stream where each consecutive output is a randomly chosen element in the sequence defined as a list of arguments. Inspired by PRand in SuperCollider.


### bl.p.seq
#### Step through a pattern sequence
Generates an event stream where each consecutive output is the next step in the sequence defined as a list of arguments. Inspired by PSeq in SuperCollider.


### bl.p.urn
#### Step through a pattern sequence in random order
Generates an event stream where each consecutive output is a step in the randomly reordered sequence defined as a list of arguments. Similar to bl.p.rand.


### bl.p.white
#### Random numbers in a range as a pattern
Generates an event stream where each consecutive output is a randomly chosen float number in the range defined by the 2nd and 3rd arguments. Inspired by PWhite in SuperCollider.


### bl.patcher (or bl.p)
#### Generate subpatchers quickly
Generates a subpatcher from a single line of code. In this subpatcher all subsequent \[objects\] and (messages) are connected in a chain. About the syntax:

For any object use square brackets. Examples:

`[metro 100 @active 1]`

`[counter 2 0 100]`

`[live.gain~ @channels 4]`

For messages use parentheses:

`(this is a message)`

`(\$1 100)`

Separate objects with "--":

`[metro 100 @active 1] -- [counter 0 100] -- (count \$1)`

White space is ignored. This will have the same result as the example above:

```
[metro 100 @active 1]           --    [counter 0 100]--(count \$1)
```

Caveats:
- instead of $ use \\$
- instead of " use \\"
- do not use the @varname attribute when declaring an object.
- commas (ie. ",") are NOT SUPPORTED due to a limitation of the \[patcherargs\] object.

In the resulting subpatcher every object- or messagebox should have its width correctly resized to fit its contents. UI objects - like \[toggle\], \[filtergraph~\], \[live.gain~\], etc. - won't get resized. However, this only goes for the built-in UI objects in Max (and some others in a few other packages).

You can also prevent an object from being resized with placing a dot after the object's closing bracket:
This will be resized to fit its contents:

`[metro 100 @active 1 @defer 1 @quantize 1]`

This will NOT be resized:

`[metro 100 @active 1 @defer 1 @quantize 1].`


### bl.randlist
#### Generate a sorted list of random floats in a range
Generates a list of float numbers of an arbitrary size with the first argument being the size of the list, the second being the bottom of the range and the third being the top.


### bl.slider
#### Adaptive slider with value display
Without given arguments bl.slider defaults to a 0-1 range. This range will extend if necessary to adapt to either an incoming number range or values set with the embedded numberbox. Dragging the embedded slider itself won't change the value range.

Passing only one argument sets the lower range limit of bl.slider, but it will still adapt the higher end of the range to incoming numbers (or ones set in the embedded numberbox).

Passing two arguments sets the range limits of bl.slider in both ends, and bl.slider won't adapt to the range of incoming numbers.


### bl.snap.seq
#### Sequence snapshot interpolation
Provides an easy-to-use interface to sequence interpolation between snapshots made with bl.viewersnaps or bl.viewersnaps+.


### bl.sourceline
#### Align sources on a line
Aligns an arbitrary number of sources on a line between the first and the last source index in the order defined as arguments.


### bl.splitext
#### Separate paths from filenames and extensions
Separates paths, filenames and file extensions. Folder strings pass through the last outlet.


### bl.split~
#### Split an audio stream into frequency bands
Splits the incoming audio into an arbitrary number of perceptually equal-width frequency bands.


### bl.uhjdecoder~
#### Decode HOA to UHJ with Spat5
Decodes a 3-dimensional Higher Order Ambisonics stream into UHJ Stereo. It uses spat5.hoa.reduce~ in compensation mode to get 1st order ambisonics, which gets converted into B-format (FuMa), which in turn gets decoded into UHJ.


### bl.viewersnaps
#### Snapshots for spat5.viewer or spat5.oper
Provides an easy-to-acces interface to storing, recalling and interpolating between snapshots of positions of objects in a spat5.viewer or spat5.oper.


### bl.viewersnaps+
#### Snapshots for spat5.viewer or spat5.oper with gen
The abstraction provides an easy-to-acces interface to storing, recalling and interpolating between snapshots of positions of objects in a spat5.viewer of spat5.oper. It is similar to bl.viewersnaps but rather than driven by a js script, this uses a gen script. This enables using it in the scheduler (high priority) thread and results in a general speed boost.


### bl.yawfix
#### Fixate the yaw of a virtual source in spat5
Continuously compensates the shift in a source's yaw as it changes position in order to fixate the yaw to a certain direction.

Usage:

1) Routepass the source's location (from your viewer or oper) to the 2nd inlet.

2) (optional) For 'lookat' mode, routepass a source or speaker position. (You can also fake it with any point by prepending a "/source/\[index\]" or a "/speaker/\[index\]") This will be used as a reference point.

3) For 'fixed' mode provide a yaw angle at the 1st inlet, and use the 1st outlet as yaw value for the source fed to the viewer or the oper. This will be the relative-to-source direction the source will always look at.

4) For 'lookat' mode provide a reference point and use the 2nd outlet as yaw value for the source fed to the viewer or the oper. In this case, the source will always look at the reference point.
