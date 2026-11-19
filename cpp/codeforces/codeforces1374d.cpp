// https://codeforces.com/problemset/problem/1374/D

#include <iostream>
#include <map>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n, k;
        std::cin >> n >> k;
        std::map<int, int> remainderFrequencies;
        long long count = 0;
        while (n--) {
            int value;
            std::cin >> value;
            int remainder = value % k;
            if (remainder == 0) continue;
            remainderFrequencies[remainder]++;
            int frequency = remainderFrequencies[remainder];
            long long operations = (long long)frequency * k - remainder + 1;
            count = (count > operations) ? count : operations;
        }
        std::cout << count << '\n';
    }
    return 0;
}
