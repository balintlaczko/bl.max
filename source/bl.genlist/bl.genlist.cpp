/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class bl_genlist : public object<bl_genlist> {
public:
    MIN_DESCRIPTION	{"Generate a list as a range of integers"};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"bl.randlist, bl.indexof, bl.getrange, zl, uzi, scale"};

    inlet<>  input {this, "Bang to get the list", "bang"};
	outlet<> output {this, "The list."};

    attribute<int> from{ this, "from", 0, description {"Start the list with this value"}};
    attribute<int> to{ this, "to", 1, description {"End the list with this value"}};

    message<> bang{ this, "bang", "Generate a list of integers between and including the from and to attributes",
        MIN_FUNCTION {
            if (from == to) {
                output.send((int) from);
                return {};
            }
            atoms outlist;
            if (from < to) {
                for (int i = from; i <= to; i++) {
                    outlist.push_back(i);
                }
            }
            else {
                for (int i = from; i >= to; i--) {
                    outlist.push_back(i);
                }
            }

            output.send(outlist);
            return {};
        }
    };

};


MIN_EXTERNAL(bl_genlist);
