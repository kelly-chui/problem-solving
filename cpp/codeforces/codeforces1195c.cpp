// https://codeforces.com/problemset/problem/1195/C

#include <iostream>
#include <vector>
#include <algorithm>
using int64 = long long;

int main() {
    int n;
    std::cin >> n;
    std::vector<int64> top(n), bottom(n);
    for (int64& x : top) std::cin >> x;
    for (int64& x : bottom) std::cin >> x;
    int64 dpTop = 0;
    int64 dpBottom = 0;
    for (int i = 0; i < n; ++i) {
        int64 newTop = top[i] + dpBottom;
        int64 newBottom = bottom[i] + dpTop;

        dpTop = std::max(dpTop, newTop);
        dpBottom = std::max(dpBottom, newBottom);
    }
    std::cout << std::max(dpTop, dpBottom) << std::endl;
}
