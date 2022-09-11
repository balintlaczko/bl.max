autowatch = 1;

var hashtag = 0;
if (jsarguments.length > 1) {
  hashtag = jsarguments[1];
}
var snaps = new Dict(hashtag + "snaps");
var subsnap1 = new Dict(hashtag + "subsnap1");
var subsnap2 = new Dict(hashtag + "subsnap2");
var subkeys, numkeys, fromval, toval, scaledval, vallength, azimdiff;

function scale(val, in_low, in_high, out_low, out_high) {
  return ((val - in_low) * (out_high - out_low)) / (in_high - in_low) + out_low;
}

function xsnapshot(from, to, ratio) {
  subsnap1 = snaps.get(from);
  subsnap2 = snaps.get(to);
  if (subsnap1 !== null) {
    subkeys = subsnap1.getkeys();
  }
  numkeys = subkeys.length;
  if (subsnap1 !== null && subsnap2 !== null) {
    for (i = 0; i < numkeys; i++) {
      fromval = subsnap1.get(subkeys[i]);
      toval = subsnap2.get(subkeys[i]);
      scaledval = [0, 0, 0];
      vallength = fromval.length;
      for (j = 0; j < vallength; j++) {
        scaledval[j] = scale(ratio, 0, 1, fromval[j], toval[j]);
      }
      outlet(0, subkeys[i], scaledval[0], scaledval[1], scaledval[2]);
    }
  } else {
    if (subsnap1 == null) {
      post("Snapshot " + from + " does not exist!\n");
    }
    if (subsnap2 == null) {
      post("Snapshot " + to + " does not exist!\n");
    }
  }
}

function xmulti() {
  var args = arrayfromargs(arguments);
  var weights = args.map(function (elem, index) {
    return elem * 0.99999;
  });
  var subsnapdicts = args.map(function (elem, index) {
    return snaps.get(index + 1);
  });
  var subkeys = subsnapdicts[0].getkeys();
  var values = subkeys.map(function (dictkey) {
    var sourceInAll = subsnapdicts.map(function (thedict) {
      return thedict.get(dictkey);
    });
    return sourceInAll;
  });
  var interpolatedValues = values.map(function (allPointsForSource, sourceInd) {
    var appliedWeightsOnPoints = allPointsForSource.map(function (
      point,
      pointindex
    ) {
      var appliedWeightOnCoord = point.map(function (valOnAxis) {
        return valOnAxis * weights[pointindex];
      });
      return appliedWeightOnCoord;
    });
    var interpolatedPoint = [0, 0, 0];
    appliedWeightsOnPoints.map(function (point, pointInd) {
      point.map(function (valOnAxis, axisInd) {
        interpolatedPoint[axisInd] += valOnAxis;
      });
    });
    return interpolatedPoint;
  });
  interpolatedValues.map(function (interPoint, sourceIndex) {
    outlet(0, subkeys[sourceIndex], interPoint);
  });
}
