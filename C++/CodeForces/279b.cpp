// https://codeforces.com/problemset/problem/279/B

#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    int n, t;
    std::cin >> n >> t;
    std::vector<int> a(n);
    for (int& i : a) {
        std::cin >> i;
    }
    int right = -1, left = 0;
    int timeSum = 0;
    int answer = 0;
    while (right < n - 1) {
        right++;
        timeSum += a[right];
        while (timeSum > t) {
            timeSum -= a[left];
            left++;
        }
        answer = std::max(answer, right - left + 1);
    }
    std::cout << answer << std::endl;
}
