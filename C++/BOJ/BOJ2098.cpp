#include <iostream>
#include <vector>
#include <algorithm>

const int INF = 987654321;

int main() {
    int n;
    std::cin >> n;
    std::vector<std::vector<int>> w(n, std::vector<int>(n));
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            std::cin >> w[i][j];
        }
    }
    int allMaskCount = 1 << n;
    std::vector<std::vector<int>> dp(allMaskCount, std::vector<int>(n, INF));
    dp[1][0] = 0;
    for (int mask = 0; mask < allMaskCount; mask++) {
        if (!(mask & 1)) continue;
        for (int lastCity = 0; lastCity < n; lastCity++) {
            if (!(mask & (1<<lastCity))) continue;
            int cur = dp[mask][lastCity];
            if (cur == INF) continue;
            for (int nextCity = 0; nextCity < n; nextCity++) {
                if (mask & (1 << nextCity)) continue;
                int distance = w[lastCity][nextCity];
                if (distance == 0) continue;
                int nextMask = mask | (1 << nextCity);
                int nextDistance = cur + distance;
                if (nextDistance < dp[nextMask][nextCity]) dp[nextMask][nextCity] = nextDistance;
            }
        }
    }
    int answer = INF;
    int full = allMaskCount - 1;
    for (int lastCity = 1; lastCity < n; lastCity++) {
        if (dp[full][lastCity] == INF || w[lastCity][0] == 0) continue;
        answer = std::min(answer, dp[full][lastCity] + w[lastCity][0]);
    }
    std::cout << answer << std::endl;
    return 0;
}
