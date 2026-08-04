//
//  main.cpp
//  algorithm
//
//  Created by KellyChui on 2023/05/17.
//

#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>

using namespace std;

struct Edge {
    int building1, building2;
    int cost;
    Edge(int building1, int building2, int cost) {
        this->building1 = building1;
        this->building2 = building2;
        this->cost = cost;
    }
    
    bool operator<(const Edge e) const {
        return this->cost > e.cost;
    }
};

int find(int a, vector<int>& parent) {
    if (parent[a] != a) {
        parent[a] = find(parent[a], parent);
    }
    return parent[a];
}

void unionValues(int a, int b, vector<int>& parent) {
    int pa = find(a, parent);
    int pb = find(b, parent);
    if (pa < pb) {
        parent[pb] = pa;
    } else {
        parent[pa] = pb;
    }
}

int main(void) {
    int n, m;
    long long maxCost = 0, minCost = 0;
    int edgeCount = 0;
    cin >> n >> m;
    vector<int> parent = {};
    for (int i = 0; i <= n; i++) {
        parent.push_back(i);
    }
    priority_queue<Edge> edgeHeap;
    for (int i = 0; i < m; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        edgeHeap.push(Edge(a, b, c));
        edgeHeap.push(Edge(b, a, c));
        maxCost += c;
    }
    
    while (!edgeHeap.empty()) {
        Edge popped = edgeHeap.top();
        edgeHeap.pop();
        if (find(popped.building1, parent) != find(popped.building2, parent)) {
            unionValues(popped.building1, popped.building2, parent);
            minCost += popped.cost;
            edgeCount++;
        }
    }
    if (edgeCount == n - 1) {
        cout << maxCost - minCost << endl;
    } else {
        cout << -1 << endl;
    }
    
    return 0;
}
