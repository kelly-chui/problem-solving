#include <cstdio>
#include <vector>
using namespace std;

void dfs(int current, int &count, vector<vector<int>> &graph, vector<bool> &isVisited, int m) {
    count++;
    isVisited[current] = true;
    for (int idx = 0; idx < graph[current].size(); idx++) {
        if (!isVisited[graph[current][idx]]) {
            dfs(graph[current][idx], count, graph, isVisited, m);
        }
    }
}

int main() {
    int n, m;
    scanf("%d %d", &n, &m);
    vector<vector<int>> graph(n + 1, vector<int>());

    for (int i = 0; i < m; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        graph[b].push_back(a);
    }

    vector<int> answer(n + 1, 0);
    int maxCount = 0;

    for (int start = 1; start <= n; start++) {
        int count = 0;
        vector<bool> isVisited(n + 1, false);
        dfs(start, count, graph, isVisited, m);
        answer[start] = count;
        maxCount = count > maxCount ? count : maxCount;
    }

    for (int idx = 1; idx < answer.size(); idx++) {
        if (answer[idx] == maxCount) {
            printf("%d ", idx);
        }
    }

    return 0;
}