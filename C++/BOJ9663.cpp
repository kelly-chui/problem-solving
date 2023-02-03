//
//  BOJ9663.cpp
//  CPPAlgorithm
//
//  Created by Kelly Chui on 2023/01/31.
//

#include <iostream>
#include <cmath>
#include <vector>

bool check(int row_idx, std::vector<int>& rows) {
    for(int idx = 0; idx < row_idx; idx++) {
        if(rows[row_idx] == rows[idx] || abs(rows[row_idx] - rows[idx]) == row_idx - idx) {
            return false;
        }
    }
    return true;
}

void backTracking(int row_idx, int n, int* answer, std::vector<int>& rows) {
    if(row_idx == n) {
        (*answer)++;
        return;
    }
    
    for(int i = 0; i < n; i++) {
        rows[row_idx] = i;
        if(check(row_idx, rows)) {
            backTracking(row_idx + 1, n, answer, rows);
        }
    }
}

int main(void) {
    int n, answer = 0;
    std::cin >> n;
    std::vector<int> rows(n);
    fill(rows.begin(), rows.end(), 0);
    
    backTracking(0, n, &answer, rows);
    std::cout << answer << std::endl;
    return 0;
}
