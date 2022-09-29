//
//  BOJ4530.cpp
//  CPPAlgorithm
//
//  Created by Kelly Chui on 2022/09/22.
//

#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;

bool isOne(int num) {
    if (num <= 1) {
        return false;
    }
    int i = 2;
    while(i * i <= num) {
        if (num % i == 0) {
            return false;
        } else {
            i++;
        }
    }
    return true;
}

bool isTwo(int num) {
    return sqrt(num) == (int)sqrt(num);
}

bool isThree(int num) {
    return cbrt(num) == (int)cbrt(num);
}

bool isFour(int num) {
    return isTwo(num) ? isTwo(sqrt(num)) : false;
}

bool isFive(int num) {
    int temp = 0;
    for(int i = num; i > 0; i = i / 10) {
        temp = temp + i % 10;
    }
    return num % temp == 0;
}

bool isSix(int num) {
    int temp = 1;
    for(int i = num; i > 0; i = i / 10) {
        temp = temp * (i % 10);
    }
    if (temp == 0) {
        return false;
    }
    return num % temp == 0;
}

bool isSeven(int num, vector<int> x) {
    for(int i = 0; i < x.size(); i++) {
        if (x[i] % num == 0 && num != x[i]) {
            return true;
        }
    }
    return false;
}

bool isEight(int num, vector<int> x) {
    for(int i = 0; i < x.size(); i++) {
        if (num % x[i] == 0 && num != x[i]) {
            return true;
        }
    }
    return false;
}

bool isNine(int num, vector<int> x) {
    for(int i = 0; i < x.size(); i++) {
        if (x[i] * x[i] == num && num != x[i]) {
            return true;
        }
    }
    return false;
}

bool isTen(int num, vector<int> x) {
    for(int i = 0; i < x.size(); i++) {
        if (x[i] * x[i] * x[i] == num && num != x[i]) {
            return true;
        }
    }
    return false;
}

bool isEleven(int num, vector<int> x) {
    for(int i = 0; i < x.size(); i++) {
        if (x[i] * x[i] * x[i] * x[i] == num && num != x[i]) {
            return true;
        }
    }
    return false;
}

bool isTwelve(int num, vector<int> x) {
    for(int i = 0; i < x.size(); i++) {
        int temp = 0;
        for(int j = x[i]; j > 0; j = j / 10) {
            temp = temp + (j % 10);
        }
        if (num % temp == 0 && num != x[i]) {
            return true;
        }
    }
    return false;
}

bool isThirteen(int num, vector<int> x) {
    for(int i = 0; i < x.size(); i++) {
        int temp = 1;
        for(int j = x[i]; j > 0; j = j / 10) {
            temp = temp * (j % 10);
        }
        if (temp == 0) {
            return false;
        }
        if (num % temp == 0 && num != x[i]) {
            return true;
        }
    }
    return false;
}

int interestingNumber(int num, vector<int> x) {
    int count = 0;
    if (isOne(num)) {
        count++;
    }
    if (isTwo(num)) {
        count++;
    }
    if (isThree(num)) {
        count++;
    }
    if (isFour(num)) {
        count++;
    }
    if (isFive(num)) {
        count++;
    }
    if (isSix(num)) {
        count++;
    }
    if (isSeven(num, x)) {
        count++;
    }
    if (isEight(num, x)) {
        count++;
    }
    if (isNine(num, x)) {
        count++;
    }
    if (isTen(num, x)) {
        count++;
    }
    if (isEleven(num, x)) {
        count++;
    }
    if (isTwelve(num, x)) {
        count++;
    }
    if (isThirteen(num, x)) {
        count++;
    }
    return count;
}

int main(void) {
    int t;
    vector<int> n;
    vector<vector<int>> x;
    
    cin >> t;
    for(int i = 0; i < t; i++) {
        int tempN;
        cin >> tempN;
        n.push_back(tempN);
        vector<int> tempX;
        for (int j = 0; j < n[i]; j++) {
            int tempXE;
            cin >> tempXE;
            tempX.push_back(tempXE);
        }
        sort(tempX.begin(), tempX.end());
        x.push_back(tempX);
    }
    
    for(int i = 0; i < t; i++) {
        cout << "DATA SET #" << i + 1 << endl;
        vector<int> interesting;
        vector<int> inter;
        int maxElement;
        for(int j = 0; j < n[i]; j++) {
            interesting.push_back(interestingNumber(x[i][j], x[i]));
        }
        maxElement = *max_element(interesting.begin(), interesting.end());
        for(int j = 0; j < n[i]; j++) {
            if (interesting[j] == maxElement) {
                inter.push_back(x[i][j]);
            }
        }
        for(int j = 0; j < inter.size(); j++) {
            cout << inter[j];
            if (j != inter.size() - 1) {
                cout << endl;
            }
        }
        cout << endl;
    }
    return 0;
}
