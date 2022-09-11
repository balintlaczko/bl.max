/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"

using namespace c74::min;


class bl_enumerate : public object<bl_enumerate> {
public:
    MIN_DESCRIPTION	{"Enumarate a list: output indices and values iteratively."};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"zl"};

    inlet<>  input {this, "the list to enumerate"};
	outlet<> index_out {this, "index"};
    outlet<> value_out{ this, "value" };
    outlet<> list_out{ this, "list of index and value" };


    // shared function
    c74::min::function enumerate = MIN_FUNCTION {
            atoms outlist(2);

            for (auto i = 0; i < args.size(); ++i) {
                outlist[0] = i;
                outlist[1] = args[i];
                list_out.send(outlist);
                value_out.send(args[i]);
                index_out.send(i);
            }

            return {};
    };

    message<> list{ this, "list", "Enumerate a list starting with a number", enumerate };
    message<> anything{ this, "anything", "Enumerate anything", enumerate };
    message<> number{ this, "number", "Enumerate a single number", enumerate };

    //// respond to the bang message to do something
    //message<> anything { this, "anything", "Respond to anything",
    //    MIN_FUNCTION {
    //        atoms outlist(2);

    //        for (auto i = 0; i < args.size(); ++i) {
    //            outlist[0] = i;
    //            outlist[1] = args[i];
    //            list_out.send(outlist);
    //            value_out.send(args[i]);
    //            index_out.send(i);
    //        }

    //        return {};
    //    }
    //};

};


MIN_EXTERNAL(bl_enumerate);
