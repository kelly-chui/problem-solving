// https://codeforces.com/problemset/problem/1285/B

#include <iostream>
#include <vector>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n;
        std::cin >> n;
        std::vector<long long> a(n);
        for (long long& ai : a) {
            std::cin >> ai;
        }
        bool isHappy = true;
        long long prefixSum = 0;
        for (int idx = 0; idx < n - 1; idx++) {
            prefixSum += a[idx];
            if (prefixSum <= 0) { 
                isHappy = false;
                break;
            }
        }
        long long suffixSum = 0;
        for (int idx = n - 1; idx > 0; idx--) {
            suffixSum += a[idx];
            if (suffixSum <= 0) { 
                isHappy = false;
                break; 
            }
        }
        std::cout << (isHappy ? "YES" : "NO") << std::endl;
    }
    return 0;
}
