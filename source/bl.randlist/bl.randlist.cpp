/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"
#include <random>

static std::random_device rd;
static std::mt19937 gen(rd());

using namespace c74::min;

double randdouble(double out_min, double out_max) {
    std::uniform_int_distribution<> dis(0, 10000000);
    return scale((double)dis(gen), 0.0, 10000000.0, out_min, out_max);
}

class bl_randlist : public object<bl_randlist> {
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
    attribute<bool> sorted{ this, "sort", false, description {"Whether to sort the resulting list before output."} };

    message<> bang{ this, "bang", "Generate a list of integers between and including the from and to attributes",
        MIN_FUNCTION {

            vector<double> outlist;

            for (int i = 0; i < length; i++) {
                outlist.push_back(randdouble(from, to));
            }

            if (sorted) {
                sort(outlist.begin(), outlist.end());
            }

            atoms outatoms = to_atoms(outlist);

            output.send(outatoms);
            return {};
        }
    };

};


MIN_EXTERNAL(bl_randlist);
