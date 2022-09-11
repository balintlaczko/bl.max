/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;


class bl_folddegree : public object<bl_folddegree> {
public:
    MIN_DESCRIPTION	{"Fold any degree into the range of -180° to 180°"};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"modulo"};

    inlet<>  input {this, "degree", "float"};
	outlet<> output {this, "degree between -180 and 180"};


    // respond to the bang message to do something
    message<> degree_in { this, "number",
        MIN_FUNCTION {
            double deg_in = args[0];
	        double wrap_360 = fmod(deg_in, 360.);
	        double folded = (int)(wrap_360 / 180) * -180. + (fmod(wrap_360, 180.));
            //cout << deg_in << endl;    // post to the max console
            output.send(folded);       // send out our outlet
            return {};
        }
    };

};


MIN_EXTERNAL(bl_folddegree);
