// https://codeforces.com/problemset/problem/1294/C

#include <iostream>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n;
        std::cin >> n;
        int divisor1 = 0;
        int divisor2 = 0;
        int divisor3 = n;
        for (int divisor = 2; divisor * divisor <= divisor3; divisor++) {
            if (divisor3 % divisor == 0) {
                divisor1 = divisor;
                divisor3 /= divisor;
                break;
            }
        }
        for (int divisor = 2; divisor * divisor <= divisor3; divisor++) {
            if (divisor3 % divisor == 0 && divisor != divisor1) {
                divisor2 = divisor;
                divisor3 /= divisor;
                break;
            }
        }
        if (divisor1 && divisor2 && divisor3 > 1 && divisor3 != divisor1 && divisor3 != divisor2) {
            std::cout << "YES" << "\n"
                      << divisor1 << " "
                      << divisor2 << " "
                      << divisor3 << std::endl;
        } else {
            std::cout << "NO" << std::endl;
        }
    }
    return 0;
}
