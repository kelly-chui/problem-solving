// https://codeforces.com/problemset/problem/189/A

#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    int n, a, b, c;
    std::cin >> n >> a >> b >> c;
    std::vector<int> dp(n + 1, -1);
    dp[0] = 0;
    for (int length = 1; length <= n; length++) {
        for (int cut : {a, b, c}) {
            if (length >= cut && dp[length - cut] != -1) {
                dp[length] = std::max(dp[length], dp[length - cut] + 1);
            }
        }
    }
    std::cout << dp[n] << std::endl;
    return 0;
}
