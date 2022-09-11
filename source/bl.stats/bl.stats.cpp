/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class bl_stats : public object<bl_stats> {
public:
    MIN_DESCRIPTION	{"Running statistics of a number stream"};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"mean, minimum, maximum, peak, trough"};

    inlet<>  input {this, "float/int to calculate stats, clear to reset stats"};
	outlet<> out_0_count {this, "number of samples"};
    outlet<> out_1_min{ this, "minimum" };
    outlet<> out_2_max{ this, "maximum" };
    outlet<> out_3_mean{ this, "mean" };
    outlet<> out_4_stdev{ this, "standard deviation" };

    int count = 0;
    double v_min = 0, v_max = 0, v_mean = 0, v_prev_mean = 0, v_s = 0, v_stdev = 0;


    message<> clear{ this, "clear", "Reset stats",
        MIN_FUNCTION {
            //reset stats
            count = 0;
            v_min = 0;
            v_max = 0;
            v_mean = 0;
            v_prev_mean = 0;
            v_s = 0;
            v_stdev = 0;
            return {};
        }
    };

    message<> number{ this, "number", "Calculate running stats",
        MIN_FUNCTION {
            double in1 = args[0];
            if (count == 0) {
                v_min = in1;
                v_max = in1;
            }
            else {
              if (in1 < v_min) {
                  v_min = in1;
              }
              if (in1 > v_max) {
                  v_max = in1;
              }
            }
            v_prev_mean = v_mean;
            count += 1;
            v_mean = v_mean + (in1 - v_mean) / count;
            v_s = v_s + ((in1 - v_mean) * (in1 - v_prev_mean));
            v_stdev = pow(v_s / (count - 1), 0.5);

            out_4_stdev.send(v_stdev);
            out_3_mean.send(v_mean);
            out_2_max.send(v_max);
            out_1_min.send(v_min);
            out_0_count.send(count);
            return {};
        }
    };

};


MIN_EXTERNAL(bl_stats);
