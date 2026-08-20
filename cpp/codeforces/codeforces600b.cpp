// https://codeforces.com/problemset/problem/600/B

#include <iostream>
#include <algorithm>
#include <vector>

int upperBound(std::vector<int>& a, int b) {
    int start = 0;
    int end = a.size();
    while (start < end) {
        int mid = (start + end) / 2;
        if (a[mid] <= b) {
            start = mid + 1;
        } else {
            end = mid;
        }
    }
    return start;
}

int main() {
    int n, m;
    std::cin >> n >> m;
    std::vector<int> a(n);
    for (int &ai : a) {
        std::cin >> ai;
    }
    std::sort(a.begin(), a.end());
    for (int i = 0; i < m; i++) {
        int b;
        std::cin >> b;
        std::cout << upperBound(a, b) 
                  << (i == (m - 1) ? "\n" : " ");
    }
    return 0;
}
