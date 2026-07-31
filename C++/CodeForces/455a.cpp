// https://codeforces.com/problemset/problem/455/A

#include <iostream>
#include <vector>
using int64 = long long;

int main() {
    int n;
    std::cin >> n;
    std::vector<int> a(n);
    std::vector<int> frequencies(100'001, 0);
    int maxValue = 0;
    for (int &ak : a) {
        std::cin >> ak;
        maxValue = maxValue > ak ? maxValue : ak;
        frequencies[ak]++;
    }
    std::vector<int64> dp(maxValue + 1);
    dp[0] = 0;
    dp[1] = frequencies[1];
    int64 answer = dp[1];
    for (int value = 2; value < maxValue + 1; value++) {
        int64 minus1 = dp[value - 1];
        int64 minus2 = dp[value - 2] + (int64)frequencies[value] * (int64)value;
        dp[value] = minus1 > minus2 ? minus1 : minus2;
        answer = answer > dp[value] ? answer : dp[value];
    }
    std::cout << answer << std::endl;
    return 0;
}
