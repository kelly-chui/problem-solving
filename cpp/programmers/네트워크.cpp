// https://school.programmers.co.kr/learn/courses/30/lessons/43162

#include <string>
#include <vector>
#include <queue>

using namespace std;

void bfs(int start, int n, vector<vector<int>>& computers, vector<bool>& isVisited) {
    queue<int> queue;
    queue.push(start);
    isVisited[start] = true;
    while (!queue.empty()) {
        int currentComputer = queue.front();
        queue.pop();
        for (int i = 0; i < n; i++) {
            if (computers[currentComputer][i] != 1) continue;
            if (isVisited[i]) continue;
            queue.push(i);
            isVisited[i] = true;
        }
    }
}

int solution(int n, vector<vector<int>> computers) {
    int answer = 0;
    vector<bool> isVisited(n, false);
    for (int i = 0; i < n; i++) {
        if (isVisited[i]) continue;
        bfs(i, n, computers, isVisited);
        answer++;
    }
    return answer;
}
