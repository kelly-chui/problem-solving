// https://leetcode.com/problems/maximum-total-subarray-value-i

#include <vector>
using namespace std;

class Solution {
public:
    long long maxTotalValue(vector<int>& nums, int k) {
        int minValue = 1000000001;
        int maxValue = -1000000001;
        for (int num: nums) {
            if (minValue > num) {
                minValue = num;
            }
            if (maxValue < num)  {
                maxValue = num;
            }
        }
        return (long long)(maxValue - minValue) * (long long)k;
    }
};
