#include <stdio.h>
#include <algorithm>
#include <vector>
#include <cmath>
using namespace std;

int main() {
    int n;
    scanf("%d", &n);
    vector<long long> solutions(n);
    for (long long& value: solutions) {
        scanf("%lld", &value);
    }
    sort(solutions.begin(), solutions.end());
    long long max = 999999999999;
    long long answer1 = 0, answer2 = 0, answer3 = 0;
    for (int first = 0; first < n - 2; first++) {
        for (int second = first + 1; second < n - 1; second++) {
            long long mix = solutions[first] + solutions[second];
            auto lower = lower_bound(solutions.begin() + second + 1, solutions.end(), mix * -1) - solutions.begin();
            auto upper = upper_bound(solutions.begin() + second + 1, solutions.end(), mix * -1) - solutions.begin();
            if (lower != upper) {
                printf("%lld %lld %lld\n", solutions[first], solutions[second], solutions[lower]);
                return 0;
            } else {
                if (lower == n) {
                    lower--;
                    if (abs(max) > abs(mix + solutions[lower])) {
                        max = mix + solutions[lower];
                        answer1 = first;
                        answer2 = second;
                        answer3 = lower;
                    }
                } else if (lower == second + 1) {
                    if (abs(max) > abs(mix + solutions[lower])) {
                        max = mix + solutions[lower];
                        answer1 = first;
                        answer2 = second;
                        answer3 = lower;
                    }
                } else {
                    lower--;
                    if (abs(max) > abs(mix + solutions[lower])) {
                        max = mix + solutions[lower];
                        answer1 = first;
                        answer2 = second;
                        answer3 = lower;
                    }
                    if (abs(max) > abs(mix + solutions[upper])) {
                        max = mix + solutions[upper];
                        answer1 = first;
                        answer2 = second;
                        answer3 = upper;
                    }
                }
            }
        }
    }
    printf("%lld %lld %lld\n", solutions[answer1], solutions[answer2], solutions[answer3]);
    return 0;
}