// https://codeforces.com/problemset/problem/489/C

#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    int m, s;
    std::cin >> m >> s;
    if (m == 1 && s == 0) {
        std::cout << "0 0" << std::endl;
        return 0;
    }
    if (9 * m < s || s == 0) {
        std::cout << "-1 -1" << std::endl;
        return 0;
    }
    std::vector<int> minVector(m, 0);
    std::vector<int> maxVector(m, 0);
    int remain = s;
    for (int idx = 0; idx < m; idx++) {
        int digit = std::min(9, remain);
        maxVector[idx] = digit;
        remain -= digit;
    }
    remain = s;
    for (int idx = 0; idx < m; idx++) {
        for (int digit = (idx == 0 ? 1 : 0); digit <= 9; digit++) {
            int nextRemain = remain - digit;
            int remainDigits = m - idx - 1;
            if (nextRemain >= 0 && nextRemain <= remainDigits * 9) {
                minVector[idx] = digit;
                remain = nextRemain;
                break;
            }
        }
    }
    for (int idx = 0; idx < m; idx++) {
        std::cout << minVector[idx];
    }
    std::cout << " ";
        for (int idx = 0; idx < m; idx++) {
        std::cout << maxVector[idx];
    }
    std::cout << std::endl;
    return 0;
}
