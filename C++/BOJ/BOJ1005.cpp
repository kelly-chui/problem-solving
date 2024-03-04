#include <cstdio>
#include <unordered_map>
#include <algorithm>

using namespace std;

int dp(int i, int* d, unordered_map<int, int*>* graph, int* dpTable) {
    if (dpTable[i] == -1) {
        if (graph->find(i) != graph->end()) {
            int maxTemp = 0;
            for (int j = 0; j < (*graph)[i][0]; j++) {
                maxTemp = max(maxTemp, dp((*graph)[i][j + 1], d, graph, dpTable));
            }
            dpTable[i] = maxTemp + d[i - 1];
        } else {
            dpTable[i] = d[i - 1];
        }
    }
    return dpTable[i];
}

int main() {
    int t;
    scanf("%d", &t);
    while (t--) {
        unordered_map<int, int*> graph;
        int* dpTable = nullptr;
        int* d = nullptr;

        int n, k;
        scanf("%d %d", &n, &k);

        d = new int[n];
        for (int i = 0; i < n; i++) {
            scanf("%d", &d[i]);
        }

        for (int i = 0; i < k; i++) {
            int x, y;
            scanf("%d %d", &x, &y);
            if (graph.find(y) == graph.end()) {
                graph[y] = new int[k + 1];
                graph[y][0] = 0;
            }
            graph[y][++graph[y][0]] = x;
        }

        int w;
        scanf("%d", &w);

        dpTable = new int[n + 1];
        fill(dpTable, dpTable + n + 1, -1);
        printf("%d\n", dp(w, d, &graph, dpTable));

        delete[] dpTable;
        delete[] d;
        for (auto& entry: graph) {
            delete[] entry.second;
        }
    }
    return 0;
}