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

### bl.3dviewer
#### 3-dimensional viewer for spat5.viewer or spat5.oper
The abstraction interprets messages from a connected spat5.viewer or spat5.oper object and visualizes the sources and speakers in a 3D scene.

Usage:
1) Connect the left-most and the dump outlet of your oper or viewer to bl.3dviewer.
2) /dump the oper or viewer so the 3dviewer fetches the positions and colors of your speakers & sources. (Later on, if you change the number, color, label or visibility of a speaker or a source, you have to /dump again, since the oper/viewer doesn't output these values automatically when changed.) 
Speaker#1 is always red.
3) Switch on "render" on the bl.3dviewer UI.
4) Drag the handle in the middle to rotate the image; clicking on "reset" or double-clicking anywhere (but the handle in the middle) on the spat3D window also resets the view to default position/orientation. Alt/Option + click&drag zooms, Cmd/Ctrl + click&drag repositions the image.
5) Use WSAD keys to move around, and Q & Z to ascend/descend.


### bl.autobp
#### Convert abstractions into bpatchers
The abstraction automatically creates a bpatcher with a specified width and height from an abstraction. To use it, simply drop it somewhere in the abstraction you want to use as a bpatcher. In case there are arguments defined for the abstraction bl.autobp fetches these and passes them through its outlet in the created bpatcher (like a patcherargs object).

In the bl package several abstractions rely on bl.autobp, such as bl.slider, bl.snap.seq or [bl.3dviewer](https://github.com/balintlaczko/bl.max/new/master?readme=1#bl3dviewer).


### bl.decode32
#### Connect a 3D ambisonics encoder to a 2D decoder
The abstraction automatically connects the horizontal spherical harmonics of a selected 3D ambisonics encoder to a 2D decoder. Works in an unlocked patcher.

Usage:
1) Select the 3D encoder and the 2D decoder you want to connect.
2) Cmd/Ctrl + click on the button connected to bl.decode32 (while you are still in editing mode and the 2 objects remain selected).
3) Alternatively Cmd/Ctrl + click on a number (representing the HOA order) while the encoder and the decoder remain selected.
