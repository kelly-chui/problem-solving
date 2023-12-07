#include <stdio.h>
#include <vector>
#include <algorithm>
#include <map>
using namespace std;

void dfs(int student, map<int, vector<int> > &graph, vector<bool> &isVisited, vector<int> &answer) {
    isVisited[student] = true;
    if (graph[student].size() != 0) {
        for (int idx = 0; idx < graph[student].size(); idx++) {
            if (!isVisited[graph[student][idx]]) {
                dfs(graph[student][idx], graph, isVisited, answer);
            }
        }
    }
    answer.push_back(student);
}

int main() {
    int n, m;
    scanf("%d %d", &n, &m);
    map<int, vector<int> > graph;
    vector<bool> isVisited(n + 1, false);
    vector<int> answer;

    for (int student = 1; student < n + 1; student++) {
        graph[student] = vector<int>();
    }
    for (int idx = 0; idx < m; idx++) {
        int a, b;
        scanf("%d %d", &a, &b);
        graph[a].push_back(b);
    }
    for (int student = 1; student < n + 1; student++) {
        if (isVisited[student]) {
            continue;
        }
        dfs(student, graph, isVisited, answer);
    }
    reverse(answer.begin(), answer.end());
    for (int idx = 0; idx < answer.size(); idx++) {
        printf(idx == answer.size() - 1 ? "%d\n": "%d ", answer[idx]);
    }
    return 0;
}