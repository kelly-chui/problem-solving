#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> a;
    for(int i = 0; i < n; i++) {
        int temp;
        cin >> temp;
        a.push_back(temp);
    }
    vector<int> stack;
    vector<int> answer;
    reverse(a.begin(), a.end());
    for(int element: a) {
        while(!stack.empty() && stack.back() <= element) {
            stack.pop_back();
        }
        if(stack.empty()) {
            answer.push_back(-1);
        } else {
            answer.push_back(stack.back());
        }
        stack.push_back(element);
    }
    for(int answerIndex = (int)answer.size() - 1; answerIndex >= 0; answerIndex--) {
        cout << answer[answerIndex] << " ";
    }
}
