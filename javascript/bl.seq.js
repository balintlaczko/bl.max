autowatch = 1;

var args;
var seq_coll;
var p = this.patcher;
var nestedObjectCounter = 0;
var objectListString = "";
var objectList = [];
var x = 448;
var y = 30;
var drunkMode = false;

function inDrunkMode() {
  drunkMode = true;
}

function p_args(a) {
  objectListString = a;
  var whileIter = 0;
  while (objectListString.indexOf("[") != -1) {
    extractNested(objectListString);
    whileIter += 1;
    if (whileIter >= 10000) {
      post("Escaping infinite loop...\n");
      break;
    }
  }
  objectList = objectListString.split(" ");
  objectList = restoreInnerSequences(objectList);
  objectList.shift();
  if (drunkMode) {
    objectList.shift();
  }
  seq_coll = p.getnamed("seq_coll");
  objectList.map(fillColl);
}

function fillColl(elem, index) {
  seq_coll.message(index, elem);
}

function restoreInnerSequences(objList) {
  var newObjList = [];
  var newSequence = "";
  var inSequence = false;
  //iterate through all elements
  for (i = 0; i < objList.length; i++) {
    //if elem has no "((" or not in the middle of a sequence
    if (objList[i].indexOf("((") == -1 && inSequence == false) {
      //just add it to the new list
      newObjList.push(objList[i]);

      //if it had "((", or we are in a sequence AND it has "))"
    } else {
      if (objList[i].indexOf("))") != -1) {
        //finish the sequence
        inSequence = false;
        //add it to the new sequence string
        newSequence += " " + objList[i];
        newSequence = newSequence.trim();
        //add the finished sequence to the new list
        newObjList.push(newSequence);
        //clear new sequence container
        newSequence = "";

        //if it had "((", or we are in a sequence, but it does NOT have "))"
      } else {
        //keep going
        inSequence = true;
        //add it to the new sequence string
        newSequence += " " + objList[i];
      }
    }
  }
  return newObjList;
}

function extractNested(argsString) {
  var start = 0;
  var end = undefined;
  var iter = 0;
  var openings = 0;
  var endings = 0;
  if (argsString.indexOf("[") != -1) {
    start = argsString.indexOf("[");
    iter = start + 1;
    while (end == undefined) {
      if (argsString.charAt(iter) == "[") {
        openings += 1;
      } else if (argsString.charAt(iter) == "]") {
        endings += 1;
        if (endings > openings) {
          end = iter;
        }
      }
      iter += 1;
      if (iter > 10000) {
        post("Escaping infinite loop...\n");
        break;
      }
    }
    if (end != undefined) {
      nestedObjectCounter += 1;
      var nestedWithBrackets = argsString.slice(start, end + 1);
      objectListString = objectListString.replace(
        nestedWithBrackets,
        "nested_" + nestedObjectCounter
      );
      var nested = argsString.slice(start + 1, end);
      var nestedObjVarname = createObject(nested, p);
      outlet(0, "replace", "nested_" + nestedObjectCounter, nestedObjVarname);
      var nestedObj = p.getnamed(nestedObjVarname);
      var dictInputProxy = p.getnamed("dict_input_proxy");
      var outletProxy = p.getnamed("outlet_proxy");
      //var indexProxy = p.getnamed("index_proxy");
      var subIndexProxy = p.getnamed("subindex_proxy");
      p.connect(nestedObj, 0, dictInputProxy, 0);
      p.connect(nestedObj, 0, outletProxy, 0);
      p.connect(nestedObj, 1, subIndexProxy, 0);
    }
  }
}

function createObject(objectString, containerPatcher) {
  var vname = "";
  if (objectString.split(" ")[0] == "bl.p.drunk") {
    vname = objectString.split(" ")[2];
  } else {
    vname = objectString.split(" ")[1];
  }
  containerPatcher.message(
    "script",
    "newobject",
    "newobj",
    "@text",
    objectString,
    "@varname",
    vname,
    "@patching_rect",
    x,
    y,
    100,
    22
  );
  x += 110;
  y += 30;
  return vname;
}
