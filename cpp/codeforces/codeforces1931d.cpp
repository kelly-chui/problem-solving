// https://codeforces.com/problemset/problem/1931/D

#include <iostream>
#include <map>
#include <utility>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n, x, y;
        std::cin >> n >> x >> y;
        std::map<std::pair<int, int>, int> frequencies;
        long long answer = 0;
        while (n--) {
            int input;
            std::cin >> input;
            int rx = input % x;
            int ry = input % y;
            answer += frequencies[{(x - rx) % x, ry}];
            frequencies[std::make_pair(rx, ry)]++;
        }
        std::cout << answer << std::endl;
    }
}
