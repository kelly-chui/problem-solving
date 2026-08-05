// https://codeforces.com/problemset/problem/451/B

#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    int n;
    std::cin >> n;
    std::vector<int> a(n);
    for (int& ai : a) {
        std::cin >> ai;
    }
    int left = 0;
    for (; left < n - 1; left++) {
        if (a[left] > a[left + 1]) break;
    }
    if (left == n - 1) {
        std::cout << "yes\n" << "1 1" << std::endl;
        return 0;
    }
    int right = left;
    for (; right < n - 1; right++) {
        if (a[right] <= a[right + 1]) break;
    }
    std::reverse(a.begin() + left, a.begin() + right + 1);
    for (int i = 0; i + 1 < n; i++) {
        if (a[i] > a[i + 1]) {
            std::cout << "no\n";
            return 0;
        }
    }
    std::cout << "yes\n" << left + 1 << ' ' << right + 1 << std::endl;
    return 0;
}
