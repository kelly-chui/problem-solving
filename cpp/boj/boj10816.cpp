//
//  BOJ10816.cpp
//  CPPAlgorithm
//
//  Created by Kelly Chui on 2022/09/20.
//

#include <algorithm>
#include <iostream>
#include <vector>

int main(void) {
    int n, m;
    std::vector<int> narray;
    std::vector<int> marray;
    
    std::cin >> n;
    for (int i = 0; i < n; i++) {
        int temp;
        std::cin >> temp;
        narray.push_back(temp);
    }
    std::cin >> m;
    for (int i = 0; i < m; i++) {
        int temp;
        std::cin >> temp;
        marray.push_back(temp);
    }
    
    sort(narray.begin(), narray.end());
    
    for (int i = 0; i < m; i++) {
        std::cout << upper_bound(narray.begin(), narray.end(), marray[i]) - lower_bound(narray.begin(), narray.end(), marray[i]);
        if (i != m - 1) {
            std::cout << " ";
        } else {
            std::cout << std::endl;
        }
    }
    return 0;
}
