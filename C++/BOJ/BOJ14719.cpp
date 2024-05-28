#include <iostream>
#include <stack>
using namespace std;

int main() {
    int h, w;
    cin >> h >> w;
    int * blocks = new int[w];
    for (int idx = 0; idx < w; idx++) {
        cin >> blocks[idx];
    }
    stack<int> blockStack;
    int answer = 0;

    int currentMax = 0;
    for (int idx = 0; idx < w; idx++) {
        if (currentMax <= blocks[idx]) {
            while (!blockStack.empty()) {
                answer += (currentMax - blockStack.top());
                blockStack.pop();
            }
            currentMax = blocks[idx];
        }
        blockStack.push(blocks[idx]);
    }

    stack<int> secondStack;
    currentMax = 0;
    while (!blockStack.empty()) {
        if (currentMax <= blockStack.top()) {
            while (!secondStack.empty()) {
                answer += (currentMax - secondStack.top());
                secondStack.pop();
            }
            currentMax = blockStack.top();
        }
        secondStack.push(blockStack.top());
        blockStack.pop();
    }

    cout << answer << endl;
    return 0;
}