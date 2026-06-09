// https://leetcode.com/problems/left-and-right-sum-differences

#include <vector>
#include <numeric>
using namespace std;

class Solution {
public:
    vector<int> leftRightDifference(vector<int>& nums) {
        const int totalSum = accumulate(nums.begin(), nums.end(), 0);
        vector<int> answer(nums.size());
        int leftSum = 0;
        for (int idx = 0; idx < nums.size(); idx++) {
            const int rightSum = totalSum - leftSum - nums[idx];
            answer[idx] = abs(leftSum - rightSum);
            leftSum += nums[idx];
        }
        return answer;
    }
};