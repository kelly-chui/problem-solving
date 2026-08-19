// https://codeforces.com/problemset/problem/478/B

#include <iostream>
using int64 = long long;

int main() {
    int64 n, m;
    std::cin >> n >> m;
    int64 perGroup = n / m;
    int64 remainder = n % m;
    int64 minK = ((perGroup * (perGroup - 1) / 2) * (m - remainder)) 
            + (((perGroup + 1) * perGroup / 2) * remainder);
    int64 maxK = (n - m + 1) * (n - m) / 2;
    std::cout << minK << " " << maxK << std::endl;
    return 0;
}
