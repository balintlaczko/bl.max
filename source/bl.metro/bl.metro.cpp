/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"
#include <random>
#include <chrono>

static std::random_device rd;
static std::mt19937 gen(rd());

using namespace c74::min;

double randdouble(double out_min, double out_max) {
    std::uniform_int_distribution<> dis(0, 10000000);
    return scale((double)dis(gen), 0.0, 10000000.0, out_min, out_max);
}

class Slide {
public:
    double prev = 0.0;
    double slide = 1.0;

    double update(double new_val) {
        double result = prev + ((new_val - prev) / slide);
        prev = result;
        return result;
    }
};

class Gtimer {
public:
    long int prevTime = 0;
    long int currTime = 0;
    long int delta = 0;
    long int timeCode = 0;

    void reset() {
        prevTime = 0;
        currTime = 0;
        delta = 0;
        timeCode = 0;
    }

    void update() {
        prevTime = currTime;
        currTime = std::chrono::system_clock::now().time_since_epoch().count();
        delta = currTime - prevTime;
        timeCode += delta;
    }
};

class bl_metro : public object<bl_metro> {
public:
    MIN_DESCRIPTION	{"An extension over [metro] with jitter, smoothing and tap-interval features."};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"metro, qmetro"};

    inlet<>  input {this, "Toggle the device (1/0), or bang repeatedly to set interval."};
	outlet<> output {this, "Bangs"};

    Slide slide;
    Gtimer gtimer;

    attribute<double> interval{ this, "interval", 1000, description {"Set the target interval of the output (before jitter)"} };
    attribute<double, threadsafe::no, limit::clamp> jitterfactor{ this, "jitterfactor", 0.0, range {0.0, 1.0}, description {"(0...1) The amount of jitter (the modulation of the target interval) can be applied at every output. A value of 1 means the next output interval can either be twice as short or twice as long as the target interval."} };
    attribute<bool> smooth{ this, "smooth", false,
        description {"Whether to smooth the momentary interval changes caused by jitter (controlled with @jitterfactor) with a slide algorithm."},
        setter { MIN_FUNCTION {
            if (args[0] == true) {
                slide.prev = interval;
            }
            return args;
        }} 
    };
    attribute<double, threadsafe::no, limit::clamp> smoothfactor{ this, "smoothfactor", 1.0, 
        range {1.0, 1000000.0}, 
        description {"Only has an effect if @smooth is on and @jitterfactor is higher than 0. Controls how much smoothing gets applied to the output intervals modulated by @jitterfactor. Uses a one-directional slide algorithm."} 
    };
    attribute<bool> active { this, "active", false, description {"Activate the object."},
        setter { MIN_FUNCTION {
            if (args[0] == true)
                metro.delay(0.0);    // fire the first one straight-away
            else
                metro.stop();
            return args;
        }}
    };

    message<> bang{ this, "bang", "Bang repeteadly to set a new interval (like a tap-tempo).",
        MIN_FUNCTION {
            gtimer.update();
            double delta = gtimer.delta / 10000;
            if (delta < 3000 && delta > 0) {
                interval = delta;
            }
            return {};
        }
    };

    timer<> metro{ this,
        MIN_FUNCTION {
            output.send("bang");
            
            double output_interval;
            if (jitterfactor == 0.0) {
                output_interval = interval;
            }
            else {
                // done in two steps so that the median is still at 0
                double direction = randdouble(0.0, 1.0) > 0.5 ? -0.5 : 1.0;
                output_interval = randdouble(0.0, direction) * jitterfactor * interval + interval;      
            }

            if (smooth) {
                slide.slide = smoothfactor;
                output_interval = slide.update(output_interval);
            }
            
            metro.delay(output_interval);
            return {};
        }
    };

    message<> toggle{ this, "int", "Toggle the state of the object.",
        MIN_FUNCTION {
            active = args[0];
            return {};
        }
    };

};


MIN_EXTERNAL(bl_metro);
