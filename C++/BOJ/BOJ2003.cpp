#include <iostream>
using namespace std;

int main() {
    int n, m;
    cin >> n >> m;
    int * a = new int[n + 1];
    int * preSum = new int[n + 1];
    a[0] = 0;
    preSum[0] = 0;
    for (int idx = 1; idx <= n; idx++) {
        cin >> a[idx];
        preSum[idx] = preSum[idx - 1] + a[idx];
    }

    int answer = 0;

    for (int end = 1; end <= n; end++) {
        for (int start = 1; start <= end; start++) {
            if (preSum[end] - preSum[start - 1] == m) {
                answer++;
                // cout << start << end << endl;
            }
        }
    }

    cout << answer << endl;
    return 0;
}