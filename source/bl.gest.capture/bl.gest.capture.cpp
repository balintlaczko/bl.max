/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"
#include <chrono>

using namespace c74::min;

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

class bl_gest_capture : public object<bl_gest_capture> {
public:
    MIN_DESCRIPTION	{"Device to record anything as a gesture and output it in coll format."};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"mtr, clocker, coll"};

    inlet<>  in_device {this, "1/0 to start/stop recording, 'dump' to output recorded gesture as a coll"};
    inlet<>  in_gest{ this, "(anything) the gesture we want to record" };
	outlet<> out_gest {this, "The recorded gesture. Connect this to a coll."};
    outlet<> out_status { this, "Status messages. 'started', 'stopped', 'dumped'" };

    Gtimer gTimer;
    std::vector<atoms> storedGesture;
    bool deviceState = false;

    // shared function
    c74::min::function gesture = MIN_FUNCTION{
            if (!deviceState || inlet == 0) {
                return {};
            }
            gTimer.update();
            atoms currGesture = to_atoms(args);
            currGesture.insert(currGesture.begin(), gTimer.timeCode / 10000);
            storedGesture.push_back(currGesture);
            return {};
    };

    message<> list{ this, "list", "Store a list of numbers as a gesture", gesture };
    message<> anything{ this, "anything", "Store anything as a gesture", gesture };
    message<> number{ this, "number", "Store a number as a gesture", gesture };

    message<> bang{ this, "bang", "testbang",
        MIN_FUNCTION {
            atoms lala = {1, "two", 3};
            lala.insert(lala.begin(), 1234);
            storedGesture.push_back(lala);
            
            out_gest.send(storedGesture.size());

            return {};
        }
    };

    message<> dump{ this, "dump", "Dump the stored gesture",
        MIN_FUNCTION {
            out_gest.send("clear");
            for (int i = 0; i < storedGesture.size(); i++) {
                atoms elem = storedGesture[i];
                out_gest.send(elem);
            }
            out_status.send("dumped");
            return {};
        }
    };

    message<> device{ this, "int", "Toggle device",
        MIN_FUNCTION {
            if (inlet == 1) {
                return {};
            }
            if (args[0] == 1) {
                deviceState = true;
                storedGesture.clear();
                gTimer.reset();
                gTimer.currTime = std::chrono::system_clock::now().time_since_epoch().count();
                out_status.send("started");
            }
            else if (args[0] == 0) {
                deviceState = false;
                gTimer.reset();
                out_status.send("stopped");
            }

            return {};
        }
    };

};


MIN_EXTERNAL(bl_gest_capture);
