// https://codeforces.com/problemset/problem/276/C
// Little Girl and Maximum Sum

#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    int n, q;
    std::cin >> n >> q;
    std::vector<int> a(n);
    long long answer = 0;
    for (int& ai : a) {
        std::cin >> ai;
    }
    std::vector<int> diff(n + 1, 0);
    while(q--) {
        int l, r;
        std::cin >> l >> r;
        diff[l - 1]++;
        diff[r]--;
    }
    for (int idx = 1; idx < n; idx++) {
        diff[idx] += diff[idx - 1];
    }
    sort(diff.begin(), diff.end(), std::greater<int>());
    sort(a.begin(), a.end(), std::greater<int>());
    for (int idx = 0; idx < n; idx++) {
        answer += ((long long)diff[idx] * (long long)a[idx]);
    }
    std::cout << answer << std::endl;
    return 0;
}
