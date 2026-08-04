#include <iostream>
using namespace std;

int main() {
    int v, n;
    cin >> v >> n;
    int * coins = new int[v];
    for (int i = 0; i < v; i++) {
        cin >> coins[i];
    }
    long long * dp = new long long[n + 1];
    for (int i = 0; i <= n; i++) {
        dp[i] = 0;
    }
    dp[0] = 1;
    for (int i = 0; i < v; i++) {
        int coin = coins[i];
        for (int money = coin; money <= n; money++) {
            dp[money] += dp[money - coin];
        }
    }
    cout << dp[n] << endl;
    delete[] coins;
    delete[] dp;
    return 0;
}
