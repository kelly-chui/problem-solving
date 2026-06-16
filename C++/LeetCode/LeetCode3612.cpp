// https://leetcode.com/problems/process-string-with-special-operations-i

#include <string>
#include <algorithm>
using namespace std;

class Solution {
public:
    string processStr(string s) {
        string answer = "";
        for (char c: s) {
            switch (c) {
                case '*':
                    if (answer.size() != 0) {
                        answer.pop_back();
                    }
                    break;
                case '#':
                    answer += answer;
                    break;
                case '%':
                    reverse(answer.begin(), answer.end());
                    break;
                default:
                    answer.push_back(c);
            }
        }
        return answer;
    }
};
