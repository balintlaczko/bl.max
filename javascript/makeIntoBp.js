autowatch = 1;

var isBpatcher = false;
var pArgs = [];
var pAutobp = this.patcher.box;
var p = this.patcher.parentpatcher;
var pName, parent;
if (p) {
  var pName = p.name;
  var parent = p.parentpatcher;
}
var width = jsarguments[1];
var height = jsarguments[2];

function p_args() {
  pArgs = arrayfromargs(arguments);
}

function makeBpatcher(x, y) {
  pArgs.push("bpat");
  var newB = parent.newdefault(
    x,
    y,
    "bpatcher",
    "@name",
    pName,
    "@presentation_rect",
    x,
    y,
    width,
    height,
    "@patching_rect",
    x,
    y,
    width,
    height,
    "@args",
    pArgs
  );
  return newB;
}

function fetchPatcherArgs() {
  var patcherargs = p.newdefault(0, 0, "patcherargs");
  var thisAutoBp = this.patcher.box;
  p.connect(patcherargs, 0, thisAutoBp, 0);
  patcherargs.message("bang");
  p.disconnect(patcherargs, 0, thisAutoBp, 0);
  p.remove(patcherargs);
}

function bang() {
  fetchPatcherArgs();
  var development = 0;
  if (p.box && !development) {
    if (pArgs[pArgs.length - 1] != "bpat") {
      var box = p.box.rect;
      var newBpat = makeBpatcher(box[0], box[1]);
      p.box.varname = "markedForDeletion";
      var old_obj = parent.getnamed("markedForDeletion");
      if (old_obj) {
        parent.remove(old_obj);
      }
    } else {
      pArgs.pop();
      if (pArgs.length) {
        outlet(0, pArgs);
      }
    }
  }
}
