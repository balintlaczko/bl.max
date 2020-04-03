autowatch = 1;
outlets = 2;

var deviceState = 0, storedGesture = []; 

var gTimer = {
    prevTime : 0,
    currTime : 0,
    delta : 0,
    timeCode : 0,
    get reset() {
        this.prevTime = 0;
        this.currTime = 0;
        this.delta = 0;
        this.timeCode = 0;
    },
    get update() {
        this.prevTime = this.currTime;
        this.currTime = Date.now();
        this.delta = this.currTime - this.prevTime;
        this.timeCode += this.delta;
    }
}

function gesture() {
    var currGesture, croppedGesture;
    if (deviceState == 1) {
        gTimer.update;
        currGesture = arrayfromargs(arguments);
        croppedGesture = currGesture.map(cropNums);
        storedGesture.push([Math.round((gTimer.timeCode * 0.001).toPrecision(4)*1000), croppedGesture]);
    }
}

function device() {
    if (arguments.length == 1) {
        if (arguments[0] == 1) {
            deviceState = 1;
            storedGesture = [];
            gTimer.reset;
            gTimer.currTime = Date.now();
            outlet(1, "started");
        } else if (arguments[0] == 0) {
            deviceState = 0;
            gTimer.reset;
            outlet(1, "stopped");
        }
    }
}

function cropNums(value) {
    if (typeof value == Number) {
        return value.toPrecision(4);
    } else {
        return value;
    }
}

function dumpGesture() {
    outlet(0, "clear");
    for (elem in storedGesture) {
        outlet(0, storedGesture[elem][0], storedGesture[elem][1]);
    }
	outlet(1, "dumped");
}