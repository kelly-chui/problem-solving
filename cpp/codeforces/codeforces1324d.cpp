// https://codeforces.com/problemset/problem/1324/D

#include <iostream>
#include <vector>
#include <algorithm>

using int64 = long long;

int upperBound(const std::vector<int64> &diff, int64 target, int start, int end) {
    int ans = end;
    while (start < end) {
        int mid = start + (end - start) / 2;
        if (diff[mid] > target) {
            ans = mid;
            end = mid;
        } else {
            start = mid + 1;
        }
    }
    return ans;
}

int main() {
    int n;
    std::cin >> n;
    std::vector<int64> a(n);
    std::vector<int64> b(n);
    for (int64& ai : a) {
        std::cin >> ai;
    }
    for (int64& bi : b) {
        std::cin >> bi;
    }
    std::vector<int64> diff(n);
    for (int idx = 0; idx < n; idx++) {
        diff[idx] = a[idx] - b[idx];
    }
    std::sort(diff.begin(), diff.end());
    int64 answer = 0;
    for (int i = 0; i < n; i++) {
        int64 target = -diff[i];
        int valid_idx = upperBound(diff, target, i + 1, n);
        answer += (n - valid_idx);
    }
    std::cout << answer << std::endl;
    return 0;
}

