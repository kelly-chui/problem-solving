// https://leetcode.com/problems/number-of-strings-that-appear-as-substrings-in-word

#include <vector>
#include <string>
using namespace std;

class Solution {
public:
    int numOfStrings(vector<string>& patterns, string word) {
        int answer = 0;
        for (const string& pattern: patterns) {
            if (word.find(pattern) != string::npos) answer++;
        }
        return answer;
    }
};
