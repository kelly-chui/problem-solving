// https://codeforces.com/problemset/problem/545/C

#include <iostream>
#include <vector>
#include <climits>

int main() {
    int n;
    std::cin >> n;
    std::vector<int> x(n);
    std::vector<int> h(n);
    for (int idx = 0; idx < n; idx++) {
        std::cin >> x[idx] >> h[idx];
    }
    int answer = 0;
    int lastOccupied = INT_MIN;
    for (int idx = 0; idx < n; idx++) {
        if (x[idx] - h[idx] > lastOccupied) {
            answer++;
            lastOccupied = x[idx];
        } else if (idx + 1 == n || x[idx] + h[idx] < x[idx + 1]) {
            answer++;
            lastOccupied = x[idx] + h[idx];
        } else {
            lastOccupied = x[idx];
        }
    }
    std::cout << answer << std::endl;
    return 0;
}
