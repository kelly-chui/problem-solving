// https://codeforces.com/problemset/problem/580/C

#include <iostream>
#include <vector>

int dfs(
    int currentNode,
    int catCount,
    std::vector<std::vector<int>>& tree,
    std::vector<int>& a,
    int m,
    int parent
) {
    bool isLeaf = true;
    int answer = 0;
    for (int nextNode : tree[currentNode]) {
        if (nextNode == parent) continue;
        isLeaf = false;
        int nextCatCount = catCount;
        if (a[nextNode] == 1) {
            nextCatCount++;
        } else {
            nextCatCount = 0;
        }
        if (nextCatCount > m) continue;
        answer += dfs(nextNode, nextCatCount, tree, a, m, currentNode);
    }
    if (isLeaf) {
        return 1;
    }
    return answer;
}

int main() {
    int n, m;
    std::cin >> n >> m;
    std::vector<int> a(n + 1);
    for (int i = 1; i <= n; i++) {
        std::cin >> a[i];
    }
    std::vector<std::vector<int>> tree(n + 1);
    for (int i = 0; i < n - 1; i++) {
        int xi, yi;
        std::cin >> xi >> yi;
        tree[xi].push_back(yi);
        tree[yi].push_back(xi);
    }
    std::cout << dfs(1, a[1], tree, a, m, -1) << std::endl;
    return 0;
}
