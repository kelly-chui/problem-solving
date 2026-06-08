// https://leetcode.com/problems/partition-array-according-to-given-pivot

#include <vector>;
using namespace std;

class Solution {
public:
    vector<int> pivotArray(vector<int>& nums, int pivot) {
        vector<int> answer;
        answer.reserve(nums.size());
        for (int num: nums) {
            if (num < pivot) answer.push_back(num);
        }
        for (int num: nums) {
            if (num == pivot) answer.push_back(num);
        }
        for (int num: nums) {
            if (num > pivot) answer.push_back(num);
        }
        return answer;
    }
};
