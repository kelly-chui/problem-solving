// https://leetcode.com/problems/gcd-of-odd-and-even-sums

#include<algorithm>
using namespace std;

class Solution {
public:
    int gcdOfOddEvenSums(int n) {
        int sumOdd = 0;
        int sumEven = 0;
        for (int num = 1; num <= n * 2; num++) {
            if (num % 2 == 0) sumEven += num;
            else if (num % 2 != 0) sumOdd += num;
        }
        while(sumEven) {
            sumOdd %= sumEven;
            swap(sumOdd, sumEven);
        }
        return sumOdd;
    }
};
