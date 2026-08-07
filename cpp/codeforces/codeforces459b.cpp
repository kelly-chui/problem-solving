// https://codeforces.com/problemset/problem/459/B
 
#include <iostream>
#include <vector>
#include <algorithm>
 
int main() {
    int n;
    std::cin >> n;
    std::vector<int> b(n);
    for (int &bi : b) {
        std::cin >> bi;
    }
    int maxBeauty = *std::max_element(b.begin(), b.end());
    int minBeauty = *std::min_element(b.begin(), b.end());
    int maxCount = std::count(b.begin(), b.end(), maxBeauty);
    int minCount = std::count(b.begin(), b.end(), minBeauty);
    long long pairCount = maxBeauty == minBeauty ? (long long)n * (long long)(n - 1) / 2 : (long long)maxCount * (long long)minCount;
    std::cout << maxBeauty - minBeauty << " " << pairCount << std::endl;
    return 0;
}
