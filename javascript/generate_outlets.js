autowatch = 1;

p = this.patcher;

function makeOutletsFor(varname, numoutlets) {
    var obj = p.getnamed(varname);
    var outlets = numoutlets;
    if (numoutlets < 0) outlets = 0;

    //cleanup
    for (var i = outlets; i < 128; i++) {
        var oldOutlet = this.patcher.getnamed("generated_outlet_" + i);
        if (oldOutlet == undefined) continue;
        this.patcher.remove(oldOutlet);
    }

    var xpos = obj.rect[0];
    var ypos = obj.rect[1] + 50;

    for (var i = 0; i < outlets; i++) {
        if (p.getnamed("generated_outlet_" + i) == undefined) {
            var newOutlet = this.patcher.newdefault(xpos, ypos, "outlet");
            newOutlet.varname = "generated_outlet_" + i;
        }
        else {
            xpos += 50;
        }
        p.connect(obj, i, newOutlet, 0);
        xpos += 50;
    }
    
    outlet(0, "bang");
}