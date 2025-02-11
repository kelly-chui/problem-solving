#include <algorithm>
#include <iostream>
#include <map>
#include <vector>

using namespace std;

int main() {
    int n, d;
    cin >> n >> d;
    map<int, vector<pair<int, int> > > graph;
    vector<int> dp(10001, 987654321);

    for (int i = 0; i < n; i++) {
        int start, end, distance;
        cin >> start >> end >> distance;
        graph[end].push_back(make_pair(start, distance));
    }
    
    dp[0] = 0;
    for (int i = 1; i <= d; i++) {
        dp[i] = dp[i - 1] + 1;
        for (auto shortcut: graph[i]) {
            dp[i] = min(dp[shortcut.first] + shortcut.second, dp[i]);
        }
    }
    cout << dp[d] << endl;
    return 0;
}
