/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;

class bl_linspace : public object<bl_linspace> {
public:
    MIN_DESCRIPTION	{"Generate a(n optionally sorted) list of random floats in a range"};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"bl.genlist, bl.indexof, bl.getrange, zl, jit.noise, scale"};

    inlet<>  input {this, "Bang to get a new list", "bang"};
	outlet<> output {this, "The list."};

    attribute<int, threadsafe::no, limit::clamp> length{ this, "length", 10, range {0, 100000}, description {"Length of the list to generate"} };
    attribute<double> from{ this, "from", 0.0, description {"Start of the range"} };
    attribute<double> to{ this, "to", 1.0, description {"End of the range"}};

    message<> bang{ this, "bang", "Generate the list",
        MIN_FUNCTION {

            vector<double> outlist;

            for (int i = 0; i < length; i++) {
                outlist.push_back(scale((double) i, 0.0, (double) length - 1, (double) from, (double) to));
            }

            atoms outatoms = to_atoms(outlist);

            output.send(outatoms);
            return {};
        }
    };

};


MIN_EXTERNAL(bl_linspace);
