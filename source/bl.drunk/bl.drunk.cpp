/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"
#include <random>

static std::random_device rd;
static std::mt19937 gen(rd());

using namespace c74::min;

//int clamp(int val, int low, int high) {
//    if (val > high) {
//        return high;
//    }
//    else if (val < low) {
//        return low;
//    }
//    else {
//        return val;
//    }
//}
int randomgen()
{
    std::uniform_int_distribution<> dis(0, 100);
    int rndnum = dis(gen);
    return rndnum;
}

int randint(int out_min, int out_max) {
    std::uniform_int_distribution<> dis(out_min, out_max);
    return dis(gen);
}

double randdouble(double out_min, double out_max) {
    std::uniform_int_distribution<> dis(0, 10000000);
    return scale((double) dis(gen), 0.0, 10000000.0, out_min, out_max);
}

int wrapint(int input, int low_bound, int high_bound) {

    if (low_bound > high_bound)
        std::swap(low_bound, high_bound);

    double x = input - low_bound;
    auto   range = high_bound - low_bound;

    if (range == 0)
        return 0;    // don't divide by zero

    if (x > range) {
        if (x > range * 2.0) {
            double d = x / range;
            long   di = static_cast<long>(d);
            d = d - di;
            x = d * range;
        }
        else {
            x -= range;
        }
    }
    else if (x < 0.0) {
        if (x < -range) {
            double d = x / range;
            long   di = static_cast<long>(d);
            d = d - di;
            x = d * range;
        }
        x += range;
    }

    auto result = x + low_bound;
    if (result >= high_bound)
        result -= range;
    return static_cast<int>(result);
}

class Change {

public:
    Change(int val) {
        value = val;
    }
    Change(double val) {
        value = val;
    }
    double value;
    int update(int val) {
        int change;
        if (val > value) {
            change = 1;
        }
        else if (val == value) {
            change = 0;
        }
        else {
            change = -1;
        }
        value = val;
        return change;
    }
    int update(double val) {
        int change;
        if (val > value) {
            change = 1;
        }
        else if (val == value) {
            change = 0;
        }
        else {
            change = -1;
        }
        value = val;
        return change;
    }
};

class bl_drunk : public object<bl_drunk> {
public:
    MIN_DESCRIPTION	{"Bidirectional drunk algorithm with repetition filtering."};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"drunk"};

    inlet<>  input {this, "bang to request new value"};
	outlet<> output {this, "chosen value"};

    attribute<int, threadsafe::no, limit::clamp> maxsize{ this, "maxsize", 300, range {0, 1000} };
    attribute<int, threadsafe::no, limit::clamp> backward_stepsize{ this, "backward_stepsize", 5, range {1, 1000} };
    attribute<int, threadsafe::no, limit::clamp> forward_stepsize{ this, "forward_stepsize", 5, range {1, 1000} };
    attribute<double, threadsafe::no, limit::clamp> forward_chance{ this, "forward_chance", 0.5, range {0.0, 1.0} };
    attribute<bool> wrap{ this, "wrap", true };
    attribute<int, threadsafe::no, limit::clamp> minval{ this, "minval", 0, range {0, 1000} };
    attribute<int, threadsafe::no, limit::clamp> maxval{ this, "maxval", 299, range {0, 1000} };
    attribute<int, threadsafe::no, limit::clamp> maxiterations{ this, "maxiterations", 100, range {1, 1000} };

    Change bw_stepsize_tracker = backward_stepsize;
    Change fw_stepsize_tracker = forward_stepsize;
    bool init = false;
    int steps_f[1000], steps_b[1000];
    int counter_f = 0, counter_b = 0;
    int val, prev_val, next_stepsize;

    message<> setval{ this, "set", "Set current value without causing output",
        MIN_FUNCTION {
            val = args[0];
            prev_val = val;
            return {};
        }
    };

    message<> bang{ this, "bang", "Request new value",
        MIN_FUNCTION {

            if (!init || fw_stepsize_tracker.update(forward_stepsize) != 0) {
                for (int i = 0; i < forward_stepsize; i++) {
                    steps_f[i] = i + 1;
                }
                for (int i = forward_stepsize - 1; i > 0; i--) {
                    int j = randint(0, i);
                    int ai = steps_f[i];
                    int aj = steps_f[j];
                    steps_f[i] = aj;
                    steps_f[j] = ai;
                }
                counter_f = 0;
            }

            if (!init || bw_stepsize_tracker.update(backward_stepsize) != 0) {
                for (int i = 0; i < backward_stepsize; i++) {
                    steps_b[i] = (i + 1) * -1;
                }
                for (int i = backward_stepsize - 1; i > 0; i--) {
                    int j = randint(0, i);
                    int ai = steps_b[i];
                    int aj = steps_b[j];
                    steps_b[i] = aj;
                    steps_b[j] = ai;
                }
                init = true;
                counter_b = 0;
            }

            minval = CLAMP(minval, 0, maxval - 1);
            maxval = CLAMP(maxval, minval, maxsize - 1);

            int attempts = 0;
            while (prev_val == val && attempts < maxiterations) {

                bool steps_forward = randdouble(0.0, 1.0) <= forward_chance;

                if (steps_forward) {
                    next_stepsize = steps_f[counter_f];

                    counter_f++;
                    Change counter_f_tracker = counter_f;
                    counter_f = wrapint(counter_f, 0, forward_stepsize);

                    if (counter_f_tracker.update(counter_f) == -1) {
                        for (int i = forward_stepsize - 1; i > 0; i -= 1) {
                            int j = randint(0, i);
                            int ai = steps_f[i];
                            int aj = steps_f[j];
                            steps_f[i] = aj;
                            steps_f[j] = ai;
                        }
                    }
                }
                else {
                    next_stepsize = steps_b[counter_b];

                    counter_b++;
                    Change counter_b_tracker = counter_b;
                    counter_b = wrapint(counter_b, 0, backward_stepsize);

                    if (counter_b_tracker.update(counter_b) == -1) {
                        for (int i = backward_stepsize - 1; i > 0; i -= 1) {
                            int j = randint(0, i);
                            int ai = steps_b[i];
                            int aj = steps_b[j];
                            steps_b[i] = aj;
                            steps_b[j] = ai;
                        }
                    }
                }

                if (wrap) {
                    val = wrapint(val + next_stepsize, minval, maxval);
                }
                else {
                    val = CLAMP(val + next_stepsize, minval, maxval);
                }
                attempts++;
            }
            prev_val = val;
            output.send(val);
            
            return {};
        }
    };

};


MIN_EXTERNAL(bl_drunk);
