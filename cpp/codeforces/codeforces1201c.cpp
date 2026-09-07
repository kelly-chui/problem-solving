// https://codeforces.com/problemset/problem/1201/C

#include <iostream>
#include <vector>
#include <algorithm>
using int64 = long long;

bool check(int64 target, int n, int k, std::vector<int>& a) {
    int64 require = 0;  // int → int64
    for (int idx = (n / 2); idx < n; idx++) {
        require += (target - a[idx] > 0 ? target - a[idx] : 0);
    }
    if (require > k) return false;
    return true;
}

int64 upperBound(int64 low, int64 high, int n, int k, std::vector<int>& a) {  // int → int64
    while (low < high) {
        int64 mid = low + (high - low) / 2;  // int → int64
        if (check(mid, n, k, a)) {
            low = mid + 1;
        } else {
            high = mid;
        }
    }
    return high - 1;
}

int main() {
    int n, k;
    std::cin >> n >> k;
    std::vector<int> a(n);
    for (int& ai : a) {
        std::cin >> ai;
    }
    std::sort(a.begin(), a.end());
    std::cout << upperBound(a[n/2], (int64)a[n/2] + k + 1, n, k, a);
    return 0;
}
