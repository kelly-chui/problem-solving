// https://codeforces.com/problemset/problem/698/A

#include <iostream>
#include <vector>
#include <algorithm>

const int INF = 987654321;

int main(void) {
    int n;
    std::cin >> n;
    std::vector<int> a(n);
    for (int& ai : a) {
        std::cin >> ai;
    }
    std::vector<std::vector<int>> dp(n, {INF, INF, INF});
    dp[0][0] = 1;
    switch (a[0]) {
        case 3:
            dp[0][2] = 0;
        case 2:
            dp[0][1] = 0;
            break;
        case 1:
            dp[0][2] = 0;
            break;
    }
    for (int idx = 1; idx < n; idx++) {
        dp[idx][0] = std::min({dp[idx-1][0], dp[idx-1][1], dp[idx-1][2]}) + 1;
        switch (a[idx]) {
            case 3:
                dp[idx][2] = std::min(dp[idx-1][0], dp[idx-1][1]);
            case 2:
                dp[idx][1] = std::min(dp[idx-1][0], dp[idx-1][2]);
                break;
            case 1:
                dp[idx][2] = std::min(dp[idx-1][0], dp[idx-1][1]);
                break;
        }
    }
    std::cout << std::min(dp[n - 1][0], std::min(dp[n - 1][1], dp[n - 1][2])) << std::endl;;
    return 0;
}
