// https://codeforces.com/problemset/problem/1927/D

#include <iostream>
#include <vector>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n;
        std::cin >> n;
        std::vector<int> a(n);
        for (int& ai : a) {
            std::cin >> ai;
        }
        std::vector<int> dp(n, n);
        for (int idx = n - 2; idx >= 0; idx--) {
            if (a[idx] != a[idx + 1]) {
                dp[idx] = idx + 1;
            } else {
                dp[idx] = dp[idx + 1];
            }
        }
        int q;
        std::cin >> q;
        while (q--) {
            int l, r;
            std::cin >> l >> r;
            if (r > dp[l]) {
                std::cout << l + 1 << " " << dp[l] + 1 << std::endl;
            } else {
                std::cout << -1 << std::endl;
            }
        }
    }
    return 0;
}
