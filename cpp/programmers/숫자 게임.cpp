#include <string>
#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;

int solution(vector<int> A, vector<int> B) {
    int answer = 0;
    sort(A.begin(), A.end());
    sort(B.begin(), B.end());
    int leftA = 0, rightA = A.size() - 1;
    int leftB = 0, rightB = B.size() - 1;
    while (leftA <= rightA) {
        if (B[rightB] > A[rightA]) {
            rightB--;
            rightA--;
            answer++;
        } else if (B[leftB] > A[rightA]) {
            leftB++;
            leftA++;
            answer++;
        } else {
            rightA--;
            leftB++;
            
        }
    }
    return answer;
}
