// https://leetcode.com/problems/weighted-word-mapping

#include <vector>
#include <string>
using namespace std;

class Solution {
public:
    string mapWordWeights(vector<string>& words, vector<int>& weights) {
        string answer;
        for (string word: words) {
            int weight = 0;
            for (char character: word) {
                weight += weights[character - 'a'];
            }
            answer.push_back('z' - (weight % 26));
        }
        return answer;
    }
};
