// https://leetcode.com/problems/maximum-building-height

#include <vector>
using namespace std;

class Solution {
public:
    int maxBuilding(int n, vector<vector<int>>& restrictions) {
        int answer = 0;
        restrictions.push_back({1, 0});
        restrictions.push_back({n, n - 1});
        sort(restrictions.begin(), restrictions.end());
        for (int i = 1; i < restrictions.size(); i++) {
            int distance = restrictions[i][0] - restrictions[i - 1][0];
            restrictions[i][1] = min(restrictions[i][1], restrictions[i - 1][1] + distance);
        }
        for (int i = restrictions.size() - 1; i > 0; i--) {
            int distance = restrictions[i][0] - restrictions[i - 1][0];
            restrictions[i - 1][1] = min(restrictions[i - 1][1], restrictions[i][1] + distance);
        }
        for (int i = 0; i < restrictions.size() - 1; i++) {
            int distance = restrictions[i + 1][0] - restrictions[i][0];
            int peakHeight = (restrictions[i][1] + restrictions[i + 1][1] + distance) / 2;
            answer = answer > peakHeight ? answer : peakHeight;
        }
        return answer;
    }
};
