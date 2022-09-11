autowatch = 1;
var sourceDict, destinationDict;


// set source dict
function source(dictName) {
    sourceDict = new Dict(dictName);
}


// set destination dict
function destination(dictName) {
    destinationDict = new Dict(dictName);
}


// main
function bang() {
    // check source
    if (sourceDict == undefined) {
        post("No source defined. Exiting...\n");
    }

    // check destination
    if (destinationDict == undefined) {
        destinationDict = new Dict();
    }

    // keys in source
    var sourceKeys = sourceDict.getkeys();
    var numParams = sourceKeys.length;
    var paramLengths = new Array(numParams);

    // count parameter lengths for each key
    sourceKeys.forEach(function (key, ind) {
        // post(key + " " + ind + " " + sourceDict.get(key).length + "\n");
        paramLengths[ind] = sourceDict.get(key).length;
    });
    // post("paramLengths: " + paramLengths + '\n');

    // calculate total number of permutations
    var numPermutations = 1;
    paramLengths.forEach(function (pLength) {
        numPermutations *= pLength;
    });
    // post("Number of permutations: " + numPermutations + "\n");

    // calculate modulos for each param
    var paramModulos = new Array(numParams);
    var divisor = 1;
    paramLengths.forEach(function (pLength, ind) {
        divisor *= pLength;
        paramModulos[ind] = numPermutations / divisor;
    });
    // post("paramModulos: " + paramModulos + '\n');

    // initialize iterators
    var iterators = new Array(numParams);
    paramLengths.forEach(function (val, ind) {
        iterators[ind] = 0;
    });

    destinationDict.clear();

    // main loop
    for (i=0; i<numPermutations; i++) {
        var result = new Array(numParams);
        var result2dict = new Dict();
        // post(i, iterators, '\n');
        sourceKeys.forEach(function (key, keyind) {
            // get param list for key
            var thisParamList = sourceDict.get(key);
            // get param from list at iterator
            var thisParamAtIterator = thisParamList[iterators[keyind]];
            // set it to result
            result[keyind] = thisParamAtIterator;
            result2dict.replace(key, thisParamAtIterator);
            destinationDict.replace(i, result2dict);
            // advance iterator for param
            // post("index " + (i+1) + " % " + paramModulos[keyind] + " = " + ((i+1) % paramModulos[keyind]) + '\n');
            if ((i+1) % paramModulos[keyind] == 0) {
                // post("Will increment at pos. " + keyind + '\n');
                iterators[keyind] += 1;
                if (iterators[keyind] > paramLengths[keyind]-1) {
                    iterators[keyind] = 0;
                    // post("Set iterator at pos. " + keyind + " to 0.\n");
                } 
            }
        });
        // post(i, result, '\n');
        // post("=======\n");
    }

    // outlet(0, destinationDict);
    outlet(0, numPermutations);
}