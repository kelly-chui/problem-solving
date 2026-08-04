#include <string>
#include <vector>
#include <queue>
#include <map>
#include <iostream>
#include <algorithm>

using namespace std;

enum Graph {
    DONUT = 1,
    BAR = 2,
    EIGHT = 3
};

Graph bfs(int start, map<int, vector<int>>& graph, vector<bool>& isVisited) {
    int nodeCount = 1;
    int edgeCount = 0;
    queue<int> q;
    q.push(start);
    isVisited[start] = true;

    while (!q.empty()) {
        int current = q.front();
        q.pop();
        for (int next : graph[current]) {
            edgeCount++;
            if (!isVisited[next]) {
                isVisited[next] = true;
                q.push(next);
                nodeCount++;
            }
        }
    }
    if (nodeCount == edgeCount) return DONUT;
    if (nodeCount == edgeCount + 1) return BAR;
    return EIGHT;
}

vector<int> solution(vector<vector<int>> edges) {
    vector<int> answer(4);
    map<int, vector<int>> graph;
    int maxNode = 0;
    for (const auto& edge : edges) {
        graph[edge[0]].push_back(edge[1]);
        maxNode = max({maxNode, edge[0], edge[1]});
    }
    vector<int> inDegree(maxNode + 1, 0);
    for (const auto& [from, tos] : graph) {
        for (int to : tos) {
            inDegree[to]++;
        }
    }
    int createdNode = 0;
    for (int i = 1; i <= maxNode; ++i) {
        if (graph[i].size() >= 2 && inDegree[i] == 0) {
            createdNode = i;
            break;
        }
    }
    vector<bool> isVisited(maxNode + 1, false);
    for (int neighbor : graph[createdNode]) {
        if (!isVisited[neighbor]) {
            Graph type = bfs(neighbor, graph, isVisited);
            answer[type]++;
        }
    }
    answer[0] = createdNode;
    return answer;
}
