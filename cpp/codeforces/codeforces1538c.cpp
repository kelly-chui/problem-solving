// https://codeforces.com/problemset/problem/1538/C

#include <iostream>
#include <vector>
#include <algorithm>

int lowerBound(
    int target,
    int low,
    int high,
    int i,
    std::vector<int>& a
) {
    while (low < high) {
        int mid = (low + high) / 2;
        if (a[i] + a[mid] >= target) {
            high = mid;
        } else {
            low = mid + 1;
        }
    }
    return high;
}

int upperBound(
    int target,
    int low,
    int high,
    int i,
    std::vector<int>& a
) {
    while (low < high) {
        int mid = (low + high) / 2;
        if (a[i] + a[mid] > target) {
            high = mid;
        } else {
            low = mid + 1;
        }
    }
    return high;
}

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n, l, r;
        std::cin >> n >> l >> r;
        std::vector<int> a(n);
        for (int& ai : a) {
            std::cin >> ai;
        }
        std::sort(a.begin(), a.end());
        long long answer = 0;
        for (int i = 0; i < n; i++) {
            answer += (upperBound(r, i + 1, n, i, a) - lowerBound(l, i + 1, n, i, a));
        }
        std::cout << answer << std::endl;
    }
    return 0;
}
