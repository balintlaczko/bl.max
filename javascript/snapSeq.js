autowatch = 1;
inlets = 1;
outlets = 3;

var deviceState = 0,
  laptimes = new Array(64),
  easings = new Array(64),
  p = this.patcher,
  lapsColl = p.getnamed("coll_laptimes"),
  easingsColl = p.getnamed("coll_easings");

var posSeq = {
  from: 1,
  to: 2,
  current: 1,
  next: 2,
  lapmode: 0,
  easing: 0,
  loop: 0,
  last_laptime: 1000,
  last_easing: 0,
  get fetchLap() {
    if (this.lapmode) {
      var current_lap = laptimes[this.current - 1];
      if (current_lap != undefined) {
        outlet(1, current_lap);
        this.last_laptime = current_lap;
      } else {
        outlet(1, this.last_laptime);
      }
    }
  },
  get fetchEasing() {
    if (this.easing) {
      var current_ease = easings[this.current - 1];
      if (current_ease != undefined) {
        outlet(2, current_ease);
        this.last_easing = current_ease;
      } else {
        outlet(2, this.last_easing);
      }
    }
  },
  get finish() {
    if (this.loop) {
      this.current = this.to;
      this.next = this.from;
      this.fetchLap;
      this.fetchEasing;
      outlet(0, 1, this.current, this.next);
      this.current = this.next;
      this.next += 1;
    } else {
      deviceState = 0;
    }
  },
  get goToNext() {
    if (this.lapmode) {
      loadLaps();
    }
    if (this.easing) {
      loadEasings();
    }
    if (this.next <= this.to) {
      //fetch and output laptime
      this.fetchLap;

      //fetch and output easing function
      this.fetchEasing;

      //interpolate
      outlet(0, 1, this.current, this.next);
      this.next += 1;
      this.current += 1;
    } else {
      this.finish;
    }
  }
};

function fromTo(newfrom, newto) {
  posSeq.from = newfrom;
  posSeq.to = newto;
}

function start() {
  deviceState = 1;
  posSeq.current = posSeq.from;
  posSeq.next = posSeq.from + 1;
  posSeq.goToNext;
}

function bang() {
  if (deviceState) {
    posSeq.goToNext;
  }
}

function lapTime() {
  var args = arrayfromargs(arguments);
  laptimes[args[0] - 1] = args[1];
}

function lapEasing() {
  var args = arrayfromargs(arguments);
  easings[args[0] - 1] = args[1];
}

function lapMode(val) {
  posSeq.lapmode = val;
}

function easingMode(val) {
  posSeq.easing = val;
}

function loopMode(val) {
  posSeq.loop = val;
}

function loadLaps() {
  lapsColl.message("dump");
}

function loadEasings() {
  easingsColl.message("dump");
}

function defaultLaptime(val) {
  posSeq.last_laptime = val;
}

function defaultEasing(val) {
  posSeq.last_easing = val;
}
