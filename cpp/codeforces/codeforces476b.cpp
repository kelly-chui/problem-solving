// https://codeforces.com/problemset/problem/476/B

#include <iostream>
#include <string>
#include <cmath>
#include <iomanip>

int combination(int n, int k) {
    int result = 1;
    for (int i = 0; i < k; i++) {
        result = result * (n - i) / (i + 1);
    }
    return result;
}

int main() {
    std::string s1, s2;
    std::cin >> s1;
    std::cin >> s2;
    int target = 0;
    for (char command: s1) {
        if (command == '+') target++;
        else target--;
    }
    int current = 0;
    int qMarkCount = 0;
    for (char command: s2) {
        if (command == '+') current++;
        else if (command == '-') current--;
        else if (command == '?') qMarkCount++;
    }
    int plusRequired = target - current + qMarkCount;
    if (plusRequired < 0 || plusRequired % 2 == 1) {
        std::cout << 0;
    } else {
        plusRequired /= 2;
        if (plusRequired > qMarkCount) {
            std::cout << 0;
        } else {
            double answer = combination(qMarkCount, plusRequired) / pow(2.0, qMarkCount);
            std::cout << std::fixed << std::setprecision(10) << answer << std::endl;
        }
    }
    return 0;
}
