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

// Function to slice a given vector
// from range X to Y
vector<double> slice_vector(vector<double>& arr,
    int X, int Y)
{

    // Starting and Ending iterators
    auto start = arr.begin() + X;
    auto end = arr.begin() + Y + 1;

    // To store the sliced vector
    vector<double> result(Y - X + 1);

    // Copy vector using copy function()
    copy(start, end, result.begin());

    // Return the final sliced vector
    return result;
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

class bl_closest : public object<bl_closest> {
public:
    MIN_DESCRIPTION	{"Fetches the closest element from the list. Searches by recursively bisecting the list."};
    MIN_TAGS		{"utilities"};
    MIN_AUTHOR		{"Balint Laczko"};
    MIN_RELATED		{"zl, minimum, maximum"};

    inlet<>  input {this, "value to get the closest match for"};
	outlet<> output {this, "closest match from the list", "number"};

    message<threadsafe::yes> number { this, "number", "Search for the closest match to this number",
        MIN_FUNCTION {
            //cout << "Got number!" << endl;
            double query = args[0];
            lock lock{ m_mutex };
            atoms data_copy = m_data;
            lock.unlock();
            double result;
            bool found_it = false;
            int attempts = 0;
            auto data = from_atoms<std::vector<double>>(data_copy);
            while (!found_it && attempts < 100) {
                int listlength = data.size();
                if (listlength <= 2) {
                    //cout << "2 or less elems" << endl;
                    double diff_0 = abs(query - data[0]);
                    double diff_1 = abs(query - data[1]);
                    int ind = diff_0 > diff_1;
                    result = data[ind];
                    found_it = true;
                }
                else {
                    //cout << "more than 2 elems" << endl;
                    int slice_index = listlength / 2 - 1;
                    // Starting and Ending iterators
                    auto start = data.begin();
                    auto middle = data.begin() + slice_index + 1;
                    auto end = data.end();
                    // To store the sliced vector
                    vector<double> part_left(slice_index + 1);
                    vector<double> part_right(listlength - slice_index - 1);
                    // Copy vector using copy function()
                    copy(start, middle, part_left.begin());
                    copy(middle, end, part_right.begin());
                    //cout << "sliced vector." << endl;
                    int part_left_size = part_left.size();
                    if (part_left[part_left_size - 1] <= query && part_right[0] >= query) {
                        double diff_0 = abs(query - part_left[part_left_size - 1]);
                        double diff_1 = abs(query - part_right[0]);
                        int ind = diff_0 > diff_1;
                        result = ind ? part_right[0] : part_left[part_left_size - 1];
                        found_it = true;
                    }
                    else {
                        if (part_left[part_left_size - 1] >= query) {
                            data = part_left;
                            //cout << "data size: " << data.size() << endl;
                        }
                        else {
                            data = part_right;
                            //cout << "data size: " << data.size() << endl;
                        }
                    }
                   
                }
                attempts++;
                //cout << "attempt " << attempts << endl;
            }
            output.send(result);
            return {};
        }
    };

    message<threadsafe::yes> list { this, "list", "Sets the list to search",
        MIN_FUNCTION {
            //cout << "Got list!" << endl;
            lock lock{ m_mutex };
            m_data.clear();
            m_data.reserve(args.size());
            m_data.insert(m_data.end(), args.begin(), args.end());
            return {};
        }
    };
private:
    atoms m_data;
    mutex m_mutex;
};


MIN_EXTERNAL(bl_closest);
