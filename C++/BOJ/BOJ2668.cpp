#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

void dfs(int start, int &cycleSize, vector<int> &table, vector<int> &tempCycle, vector<int> &memoTable, vector<int> &answerVec) {
    auto cycleChecker = find(tempCycle.begin(), tempCycle.end(), start);
    if (cycleChecker == tempCycle.end()) {
        cycleSize++;
        tempCycle.push_back(start);
        dfs(table[start], cycleSize, table, tempCycle, memoTable, answerVec);
    } else {
        if (tempCycle[0] == start) {
            for (int element: tempCycle) {
                memoTable[element] = cycleSize;
                answerVec.push_back(element);
            }
        } else {
            return;
        }
    }
}

int main() {
    int n;
    cin >> n;
    vector<int> table(n + 1, 0);
    vector<int> memoTable(n + 1, 0); // -1: out of cycle, 0: initial state,
    vector<int> answerVec;

    for (int idx = 1; idx <= n; idx++) {
        cin >> table[idx];
        if (table[idx] == idx) {
            memoTable[idx] = 1;
            answerVec.push_back(idx);
        }
    }

    for (int start = 1; start <= n; start++) {
        if (memoTable[start] != 0) {
            continue;
        }
        int cycleSize = 0;
        vector<int> tempCycle;
        dfs(start, cycleSize, table, tempCycle, memoTable, answerVec);
    }

    cout << answerVec.size() << endl;
    sort(answerVec.begin(), answerVec.end());
    for(int element: answerVec) {
        cout << element << endl;
    }
    return 0;
}