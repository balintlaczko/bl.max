autowatch = 1;

var p = this.patcher;
var firstSource, lastSource, numBetween, interval;

var height = 40;
var width = 200;

function line() {
  var sourceArray = arrayfromargs(arguments);
  firstSource = sourceArray[0];
  lastSource = sourceArray[sourceArray.length - 1];
  outlet(0, "last", lastSource);
  outlet(0, "first", firstSource);
  numBetween = sourceArray.length - 2;
  interval = 1 / (sourceArray.length - 1);

  var refreshBangProxy = p.getnamed("refreshBangProxy");
  var dictFromProxy = p.getnamed("dictFromProxy");
  var dictToProxy = p.getnamed("dictToProxy");
  var outputProxy = p.getnamed("outputProxy");

  var xpos = 10;
  var ypos = 50;

  for (var i = 1; i < 129; i++) {
    var oldModule = p.getnamed("sourceLineModule" + i);
    p.remove(oldModule);
  }

  for (var i = 0; i < numBetween; i++) {
    if (i % 10 == 0 && i > 0) {
      xpos += 230;
      ypos = 50;
    }
    var newModule = p.newdefault(
      xpos,
      ypos,
      "sourceLinesModule",
      sourceArray[0],
      sourceArray[i + 1],
      interval * (i + 1)
    );
    newModule.varname = "sourceLineModule" + (i + 1);
    p.message("script", "size", newModule.varname, width, height);
    p.connect(refreshBangProxy, 0, newModule, 0);
    p.connect(dictFromProxy, 0, newModule, 1);
    p.connect(dictToProxy, 0, newModule, 2);
    p.connect(newModule, 0, outputProxy, 0);

    ypos += 30;
  }
  outlet(0, "bang");
}
