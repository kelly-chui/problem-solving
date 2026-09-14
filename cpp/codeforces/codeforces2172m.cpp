// https://codeforces.com/problemset/problem/2172/M

#include <iostream>
#include <vector>
#include <queue>

std::vector<int> bfs(int n, int start, std::vector<std::vector<int>>& graph) {
    std::queue<int> queue;
    std::vector<int> isVisited(n + 1);
    std::vector<int> dist(n + 1, -1);
    queue.push(start);
    isVisited[start] = 1;
    dist[start] = 0;
    while (!queue.empty()) {
        int current = queue.front();
        queue.pop();
        for (int next : graph[current]) {
            if (!isVisited[next]) {
                isVisited[next] = 1;
                dist[next] = dist[current] + 1;
                queue.push(next);
            }
        }
    }
    return dist;
}

int main() {
    int n, m, k;
    std::cin >> n >> m >> k;
    std::vector<int> a(n + 1);
    for (int idx = 1; idx <= n; idx++) {
        std::cin >> a[idx];
    }
    std::vector<std::vector<int>> graph(n + 1);
    while (m--) {
        int u, v;
        std::cin >> u >> v;
        graph[u].push_back(v);
        graph[v].push_back(u);
    }
    std::vector<int> dist = bfs(n, 1, graph);
    std::vector<int> answer(k + 1, 0);
    for (int idx = 1; idx <= n; idx++) {
        answer[a[idx]] = std::max(answer[a[idx]], dist[idx]);
    }
    for (int idx = 1; idx <= k; idx++) {
        std::cout << answer[idx] << (idx != k ? " " : "\n");
    }
    return 0;
}
