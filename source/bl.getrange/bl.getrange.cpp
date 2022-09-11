/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class bl_getrange : public object<bl_getrange> {
public:
    MIN_DESCRIPTION	{"Get the range (running min and max) of a number stream"};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"bl.genlist, bl.randlist, bl.indexof, peak, trough, minimum, maximum, zl"};

    inlet<>  input {this, "Number (int, float, list), 'clear', or bang."};
	outlet<> output {this, "The running minimum and maximum (list).", "list"};

    double running_min, running_max;
    bool cleared = true;

    message<> list{ this, "list", "Test a list of numbers",
        MIN_FUNCTION {
            vector<double> listin = from_atoms<std::vector<double>>(args);
            double max_elem = *max_element(listin.begin(), listin.end());
            double min_elem = *min_element(listin.begin(), listin.end());
            if (cleared) {
                running_min = min_elem;
                running_max = max_elem;
                cleared = false;
            }
            else {
                if (running_min > min_elem) {
                    running_min = min_elem;
                }
                if (running_max < max_elem) {
                    running_max = max_elem;
                }
            }
            atoms outlist = { running_min, running_max };
            output.send(outlist);
            return {};
        }
    };

    message<> number{ this, "number", "Test a number",
        MIN_FUNCTION {
            double new_num = args[0];
            if (cleared) {
                running_min = new_num;
                running_max = new_num;
                cleared = false;
            }
            else {
                if (running_min > new_num) {
                    running_min = new_num;
                }
                if (running_max < new_num) {
                    running_max = new_num;
                }
            }
            atoms outlist = { running_min, running_max };
            output.send(outlist);
            return {};
        }
    };

    message<> clear{ this, "clear", "Clear internal memory",
        MIN_FUNCTION {
            cleared = true;
            return {};
        }
    };

    message<> bang{ this, "bang", "Generate a list of integers between and including the from and to attributes",
        MIN_FUNCTION {
            atoms outlist = {running_min, running_max};
            output.send(outlist);
            return {};
        }
    };

};


MIN_EXTERNAL(bl_getrange);
