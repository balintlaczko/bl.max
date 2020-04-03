autowatch = 1;

var p = this.patcher.parentpatcher;
var subPatch, thisp, pbox, lastHeight, invalidCounter;

var x = 20;
var y = 20;
var objectList = [];
var messageIndices = [];
var notToBeResizedIndices = [];
var inputString = "";
var defaultBoxHeight = getDefaultBoxHeight();

var dontResize = [
  "inlet",
  "outlet",
  "toggle",
  "button",
  "textbutton",
  "tab",
  "ubutton",
  "qswitch",
  "qswitch2",
  "incdec",
  "led",
  "matrixctrl",
  "playbar",
  "pictctrl",
  "radiogroup",
  "number",
  "flonum",
  "number~",
  "slider",
  "dial",
  "gain",
  "kslider",
  "multislider",
  "rslider",
  "nodes",
  "nslider",
  "pictslider",
  "bpatcher",
  "live.button",
  "live.dial",
  "live.grid",
  "live.numbox",
  "live.gain~",
  "live.meter~",
  "live.slider",
  "live.tab",
  "live.text",
  "live.arrows",
  "live.line",
  "live.step",
  "plot~",
  "function",
  "mc.function",
  "itable",
  "ezdac~",
  "ezadc~",
  "filtergraph~",
  "scope~",
  "spectroscope~",
  "jit.pwindow",
  "imubu",
  "spat5.viewer.embedded",
  "spat5.oper.embedded",
  "spat5.ircamverb.embedded",
  "spat5.routing.embedded",
  "spat5.matrix.embedded",
  "spat5.speaker.config.embedded",
  "spat5.sofa.loader.embedded",
  "spat5.hlshelf.embedded",
  "spat5.compressor.embedded",
  "spat5.filterdesign.embedded",
  "spat5.frequencyresponse.embedded",
  "spat5.eq.embedded",
  "spat5.graphiceq.embedded",
  "spat5.zplane.embedded",
  "spat5.hoa.focus.embedded",
  "spat5.hoa.display.embedded",
  "spat5.hoa.metrics.embedded",
  "spat5.hoa.beam.embedded",
  "spat5.hoa.triangle.embedded",
  "spat5.simone.embedded",
  "spat5.sf.list.embedded",
  "spat5.edc",
  "spat5.plot",
  "spat5.hoa.plot",
  "spat5.osc.view",
  "spectrumdraw~",
  "o.compose",
  "o.display",
  "o.expr.codebox"
];

function getDefaultBoxHeight() {
  var testObj = p.newdefault(0, 0, "trigger");
  var testObjHeight = testObj.getattr("patching_rect")[3];
  p.remove(testObj);
  return testObjHeight;
}

function makePatchInSubpatch(a) {
  x = 20;
  y = 20;
  messageIndices = [];
  notToBeResizedIndices = [];
  invalidCounter = 0;
  inputString = "";
  objectList = a.split("--"); // the "patchcord"
  objectList = objectList.map(trimAndRemoveBrackets);
  objectList = objectList.filter(discardNullObjects);
  objectList.map(incrementPString);
  inputString = inputString.slice(0, -1);
  objectList.unshift("inlet");
  objectList.push("outlet");
  subPatch = makeSubPatch();
  thisp = subPatch.subpatcher();
  objectList.map(makeObjectBelowInSubpatch);
  connectAllInSubpatch();
  subPatch.varname = "theSubPatch";
  fix_width(subPatch.varname, p, defaultBoxHeight);
  subPatch.varname = "";
  removeScriptingNames();
  removeAbstraction();
}

function incrementPString(objectString) {
  inputString += objectString.split(" ")[0] + "_";
}

function trimAndRemoveBrackets(objectString, index) {
  //remove leading and trailing spaces
  var trimmed = objectString.trim();
  var hasDot = false;
  //not if object should not be resized ("autofix width")
  if (trimmed.charAt(trimmed.length - 1) == ".") {
    //notToBeResizedIndices.push(index);
    hasDot = true;
    trimmed = trimmed.slice(0, -1);
  }
  //if the syntax is used correctly, return the object string
  if (
    ["[", "("].indexOf(trimmed.charAt(0)) != -1 &&
    ["]", ")"].indexOf(trimmed.charAt(trimmed.length - 1)) != -1
  ) {
    //note if the object should be a message box
    if (trimmed.charAt(0) == "(" && trimmed.charAt(trimmed.length - 1) == ")") {
      messageIndices.push(index - invalidCounter);
    }
    if (hasDot) {
      notToBeResizedIndices.push(index - invalidCounter);
    }
    return trimmed.slice(1, -1);
  } else {
    invalidCounter += 1;
  }
}

function discardNullObjects(elem) {
  return elem != undefined;
}

function makeObjectBelowInSubpatch(objectString, index) {
  if (messageIndices.indexOf(index - 1) != -1) {
    subPatch.message(
      "script",
      "newobject",
      "message",
      "@text",
      objectString,
      "@varname",
      "obj_" + index,
      "@patching_position",
      x,
      y
    );
  } else {
    subPatch.message(
      "script",
      "newobject",
      "newobj",
      "@text",
      objectString,
      "@varname",
      "obj_" + index,
      "@patching_position",
      x,
      y
    );
  }

  if (notToBeResizedIndices.indexOf(index - 1) == -1) {
    fix_width("obj_" + index, thisp, 22);
  }

  var target = thisp.getnamed("obj_" + index);
  var dims = target.getattr("patching_rect");
  lastHeight = dims[3];

  y += 20 + lastHeight;
}

function makeSubPatch() {
  pbox = this.patcher.box.rect;
  if (pbox) {
    return p.newdefault(pbox[0], pbox[1], "p", inputString);
  } else {
    return p.newdefault(0, 0, "p", inputString);
  }
}

function connectAllInSubpatch() {
  var objCounter = 0;
  var thisp = subPatch.subpatcher();
  thisp.message("wclose");
  var fromObj = thisp.getnamed("obj_" + objCounter);
  var toObj = thisp.getnamed("obj_" + (objCounter + 1));
  while (toObj) {
    // if (toObj.maxclass != "outlet") {
    //   if (notToBeResizedIndices.indexOf(objCounter) == -1) {
    //     fix_width("obj_" + (objCounter + 1), thisp, 22);
    //   }
    // }
    thisp.connect(fromObj, 0, toObj, 0);
    objCounter += 1;
    fromObj = thisp.getnamed("obj_" + objCounter);
    toObj = thisp.getnamed("obj_" + (objCounter + 1));
  }
}

function removeAbstraction() {
  this.patcher.box.varname = "markedForDeletion";
  var old_obj = p.getnamed("markedForDeletion");
  if (old_obj) {
    p.remove(old_obj);
  }
}

function removeScriptingNames() {
  var thisp = subPatch.subpatcher();
  var objCounter = 0;
  var testObj = thisp.getnamed("obj_" + objCounter);
  while (testObj) {
    testObj.varname = "";
    objCounter += 1;
    testObj = thisp.getnamed("obj_" + objCounter);
    if (objCounter > 1000) {
      break;
    }
  }
}

function fix_width(objectVarname, containerPatch, defObjectHeight) {
  var target = containerPatch.getnamed(objectVarname);
  if (dontResize.indexOf(target.maxclass) != -1) {
    return;
  }
  var dims = target.getattr("patching_rect");
  var dim_x = dims[0];
  var dim_y = dims[1];
  var height = dims[3];
  var width = dims[2];
  var minWidth = 30;

  var new_width = width;
  var new_height = height;
  var counter = 0;
  var directionIncrement, condition, finalAdjust;

  if (new_height > defObjectHeight) {
    directionIncrement = 1;
    condition = new_height > defObjectHeight;
  } else {
    directionIncrement = -1;
    condition = new_height <= defObjectHeight;
  }
  while (condition) {
    if (counter > 1000) {
      break;
    }
    target.rect = [dim_x, dim_y, dim_x + new_width, height];
    dims = target.getattr("patching_rect");
    new_height = dims[3];
    if (dims[2] <= minWidth) {
      break;
    }
    new_width = dims[2] + directionIncrement;
    counter += 1;

    if (directionIncrement == 1) {
      condition = new_height > defObjectHeight;
      finalAdjust = -1;
    } else {
      condition = new_height <= defObjectHeight;
      finalAdjust = 2;
    }
    target.rect = [dim_x, dim_y, dim_x + new_width + finalAdjust, height];
  }
}
