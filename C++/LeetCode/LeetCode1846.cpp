// https://leetcode.com/problems/maximum-element-after-decreasing-and-rearranging

#include <algorithm>
#include <vector>
using namespace std;

class Solution {
public:
    int maximumElementAfterDecrementingAndRearranging(vector<int>& arr) {
        int n = arr.size();
        sort(arr.begin(), arr.end());
        if (arr[0] != 1) arr[0] = 1;
        for (int idx = 1; idx < n; idx++) {
            arr[idx] = arr[idx] > arr[idx - 1] + 1 ? arr[idx - 1] + 1 : arr[idx];
        }
        return arr[arr.size() - 1];
    }
};
