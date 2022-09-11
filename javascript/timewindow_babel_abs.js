autowatch = 1;
outlets = 1;

var numTaps = 0;
var taps = [];
var timeWindows = [];

function init() {
	timeWindows = [];
	for (var i = 0; i < taps.length; i++) {
		timeWindows.push(new TimeWindow(1, taps[i]));
	}
}

function initwith() {
	args = arrayfromargs(arguments);
	numTaps = args.length;
	taps = args;
	init();
}

function frame() {
	feats_arr = arrayfromargs(arguments);
	
    for (var i = 0; i < timeWindows.length; i++) {
        timeWindows[i].update(feats_arr);
        timeWindows[i].outputMean(i);
    }		
}

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray(arr) || _nonIterableSpread(); }

function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _iterableToArray(iter) { if (typeof Symbol !== "undefined" && iter[Symbol.iterator] != null || iter["@@iterator"] != null) return Array.from(iter); }

function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) return _arrayLikeToArray(arr); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var TimeWindow = /*#__PURE__*/function () {
  "use strict";

  function TimeWindow(length, depth) {
    _classCallCheck(this, TimeWindow);

    this.length = length;
    this.depth = depth;
    this.memory = [];
    this.mean = [];

    for (var i = 0; i < length; i++) {
      this.memory.push([]);
      this.mean.push(0.);
    }
  }

  _createClass(TimeWindow, [{
    key: "reset",
    value: function reset(length, depth) {
      this.length = length;
      this.depth = depth;
      this.memory = [];
      this.mean = [];

      for (var i = 0; i < length; i++) {
        this.memory.push([]);
        this.mean.push(0.);
      }
    }
  }, {
    key: "update",
    value: function update(newlist) {
      if (newlist.length != this.length) {
        this.reset(newlist.length, this.depth);
      }

      for (var i = 0; i < newlist.length; i++) {
        this.memory[i].push(newlist[i]);

        if (this.memory[i].length > this.depth) {
          this.memory[i].shift();
        }
      }

      this.calcMean();
    }
  }, {
    key: "calcMean",
    value: function calcMean() {
      for (var i = 0; i < this.length; i++) {
        if (this.memory[i] == undefined) {
          continue;
        }

        var sum = 0.;

        for (var j = 0; j < this.memory[i].length; j++) {
          sum += this.memory[i][j];
        }

        this.mean[i] = sum / this.memory[i].length;
      }
    }
  }, {
    key: "outputMean",
    value: function outputMean(outlet_num) {
		outlet(0, [outlet_num].concat(this.mean));
    }
  }]);

  return TimeWindow;
}();