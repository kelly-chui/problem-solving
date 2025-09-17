#include <iostream>
#include <algorithm>

int find(int a, std::vector<int> &parents) {
    if (a != parents[a]) parents[a] = find(parents[a], parents);
    return parents[a];
}

void unionSets(int a, int b, std::vector<int> &parents, std::vector<int> &size, std::vector<int> &c) {
    int pa = find(a, parents);
    int pb = find(b, parents);
    if (pa == pb) return;
    if (size[pa] > size[pb]) {
        parents[pb] = pa;
        size[pa] += size[pb];
        c[pa] += c[pb];
    } else {
        parents[pa] = pb;
        size[pb] += size[pa];
        c[pb] += c[pa];
    }
}

int main() {
    int n, m, k, answer = 0;
    std::cin >> n >> m >> k;
    std::vector<int> c(n + 1, 0);
    std::vector<int> parents(n + 1, 0);
    std::vector<int> size(n + 1, 1);
    for (int i = 1; i <= n; i++) {
        std::cin >> c[i];
        parents[i] = i;
    }
    for (int i = 0; i < m; i++) {
        int a, b;
        std::cin >> a >> b;
        unionSets(a, b, parents, size, c);
    }
    std::vector<int> dp(k, 0);
    for (int i = 1; i <= n; i++) {
        if (i != find(i, parents)) continue;
        int w = size[i];
        int v = c[i];
        for (int j = k - 1; j >= w; j--) dp[j] = std::max(dp[j], dp[j - w] + v);
    }
    for (int i = 0; i < k; i++) answer = std::max(answer, dp[i]);
    std::cout << answer << std::endl;
    return 0;
}
