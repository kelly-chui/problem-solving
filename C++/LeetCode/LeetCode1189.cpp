// https://leetcode.com/problems/maximum-number-of-balloons

#include <vector>
#include <string>
using namespace std;

class Solution {
public:
    int maxNumberOfBalloons(string text) {
        vector<int> alphabets(26);
        for (char c: text) {
            alphabets[c - 'a']++;
        }
        return min({
            alphabets['b' - 'a'],
            alphabets['a' - 'a'],
            alphabets['l' - 'a'] / 2,
            alphabets['o' - 'a'] / 2,
            alphabets['n' - 'a']
        });
    }
};
