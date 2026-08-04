// https://codeforces.com/problemset/problem/25/A

#include <iostream>

int main() {
    int n;
    std::cin >> n;

    int oddCount = 0;
    int evenCount = 0;
    int oddIndex = 0;
    int evenIndex = 0;

    for (int i = 1; i <= n; ++i) {
        int number;
        std::cin >> number;

        if (number % 2 == 0) {
            ++evenCount;
            evenIndex = i;
        } else {
            ++oddCount;
            oddIndex = i;
        }
    }

    std::cout << (oddCount == 1 ? oddIndex : evenIndex) << '\n';
}
