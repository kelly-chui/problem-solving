#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    int n, k;
    cin >> n >> k;
    int *dolls = new int[n];
    for (int i = 0; i < n; i++) {
        cin >> dolls[i];
    }
    int start = 0, end = 0;
    int lionCount = 0;
    int answer = 987654321;

    while (end < n) {
        if (dolls[end] == 1) {
            lionCount++;
        }
        if (lionCount == k) {
            while (dolls[start] != 1) {
                start++;
            }
            answer = min(answer, end - start + 1);
            start++;
            lionCount--;
        }
        end++;
    }

    if (answer == 987654321) {
        answer = -1;
    }
    cout << answer << endl;
    return 0;
}