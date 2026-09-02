// https://codeforces.com/problemset/problem/2254/E

#include <iostream>
#include <vector>
#include <set>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n;
        std::cin >> n;
        std::vector<int> b(n);
        for (int& bi : b) std::cin >> bi;
        std::vector<long long> a(n);
        int currentIdx = 0;
        long long currentSum = 0;
        int start = INT_MAX;
        for (int bi : b) {
            if (bi >= 1 && bi < start) start = bi;
        }
        if (start == INT_MAX) {
            std::cout << -1 << '\n';
            continue;
        }
        a[currentIdx++] = start;
        currentSum += start;
        std::multiset<long long> setB(b.begin(), b.end());
        setB.erase(setB.find(start));
        bool isPossible = true;
        while (!setB.empty()) {
            auto it = setB.lower_bound(1 - currentSum);
            if (it == setB.end()) {
                isPossible = false;
                break;
            }
            currentSum += *it;
            a[currentIdx++] = currentSum;
            setB.erase(it);
        }
        if (!isPossible) {
            std::cout << -1 << '\n';
            continue;
        }
        for (int i = 0; i < n; i++) {
            std::cout << a[i] << (i == n - 1 ? "\n" : " ");
        }
    }
    return 0;
}
