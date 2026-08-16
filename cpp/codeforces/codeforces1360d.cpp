// https://codeforces.com/problemset/problem/1360/D
// D. Buying Shovels

#include <iostream>
#include <algorithm>
#include <cmath>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n, k;
        std::cin >> n >> k;
        int answer = 1;
        for (int i = 1; i <= sqrt(n); i++) {
            if (n % i == 0) {
                if (i <= k) answer = std::max(answer, i);
                if (n / i <= k) answer = std::max(answer, n / i);
            }
        }
        std::cout << (n / answer) << std::endl;
    }
    return 0;
}
