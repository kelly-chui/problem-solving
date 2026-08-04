// https://codeforces.com/problemset/problem/230/B

#include <iostream>
#include <cstring>
#include <cmath>

int main() {
    int n;
    std::cin >> n;
    long long *x = new long long[n];
    for (int i = 0; i < n; i++) {
        std::cin >> x[i];
    }
    bool *isPrime = new bool[1'000'001];
    memset(isPrime, true, sizeof(bool) * 1'000'001);
    isPrime[0] = false;
    isPrime[1] = false;
    for (int i = 2; i < 1'000'001; i++) {
        if (isPrime[i]) {
            for (int j = i * 2; j < 1'000'001; j += i) {
                isPrime[j] = false;
            }
        }
    }
    for (int i = 0; i < n; i++) {
        long long sqrtX = (long long)sqrt((double)x[i]);
        if ((sqrtX + 1) * (sqrtX + 1) == x[i]) {
            sqrtX++;
        }
        if (isPrime[sqrtX] && sqrtX * sqrtX == x[i]) {
            std::cout << "YES" << std::endl;
        }
        else {
            std::cout << "NO" << std::endl;
        }
    }
    delete[] x;
    delete[] isPrime;
    return 0;
}
