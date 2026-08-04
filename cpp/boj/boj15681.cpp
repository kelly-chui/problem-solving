#include <cstdio>
#include <vector>

int dfs(
    int parent,
    int cur,
    const std::vector<std::vector<int>>& tree,
    std::vector<int>& nodeCount
) {
    nodeCount[cur] = 1;
    for (int nxt : tree[cur]) {
        if (nxt == parent) continue;
        nodeCount[cur] += dfs(cur, nxt, tree, nodeCount);
    }
    return nodeCount[cur];
}

int main() {
    int n, r, q;
    scanf("%d %d %d", &n, &r, &q);
    std::vector<std::vector<int>> tree(n + 1);
    std::vector<int> nodeCount(n + 1, 0);
    for (int idx = 0; idx < n - 1; idx++) {
        int u, v;
        scanf("%d %d", &u, &v);
        tree[u].push_back(v);
        tree[v].push_back(u);
    }
    dfs(-1, r, tree, nodeCount);
    for (int idx = 0; idx < q; idx++) {
        int u;
        scanf("%d", &u);
        printf("%d\n", nodeCount[u]);
    }
    return 0;
}
