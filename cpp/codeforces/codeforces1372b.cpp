// https://codeforces.com/problemset/problem/1372/B

#include <iostream>

int main() {
    int t;
    std::cin >> t;
    while(t--) {
        int n;
        std::cin >> n;
        bool found = false;
        for (int divisor = 2; divisor * divisor <= n; divisor++) {
            if (n % divisor == 0) {
                std::cout << n / divisor 
                        << " " 
                        << n - n / divisor 
                        << "\n";
                found = true;
                break;
            }
        }
        if (!found) {
            std::cout << 1 << " " << n - 1 << "\n";
        }
    }
    return 0;
}
