// https://codeforces.com/problemset/problem/1526/B

#include <iostream>
#include <vector>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int x;
        bool isPossible = false;
        std::cin >> x;
        for (int b = 0; b < 11; b++) {
            if (x - (b * 111) < 0) break;
            if ((x - (b * 111)) % 11 == 0) {
                isPossible = true;
                break;
            }
        }
        std::cout << (isPossible ? "YES" : "NO") << std::endl;
    }
    return 0;
}
