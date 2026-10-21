// https://codeforces.com/problemset/problem/479/C

#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    int n;
    std::cin >> n;
    std::vector<std::pair<int, int>> exams(n);
    for (int idx = 0; idx < n; idx++) {
        std::cin >> exams[idx].first >> exams[idx].second;
    }
    std::sort(exams.begin(), exams.end());
    int lastestExamTime = 0;
    for (std::pair<int, int> exam : exams) {
        int a = exam.first;
        int b = exam.second;
        if (lastestExamTime <= b) {
            lastestExamTime = b;
        } else {
            lastestExamTime = a;
        }
    }
    std::cout << lastestExamTime << std::endl;
    return 0;
}
