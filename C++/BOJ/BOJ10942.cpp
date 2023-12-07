#include <iostream>
#include <vector>
using namespace std;

int main() {
    int n;
    scanf("%d", &n);
    int* integers = new int[n];
    bool** dp = new bool*[n];
    for(int i = 0; i < n; i++) {
        dp[i] = new bool[n] {false, };
    }
    
    for(int i = 0; i < n; i++) {
        scanf("%d", &integers[i]);
    }
    for(int i = 0; i < n; i++) {
        dp[i][i] = true;
        if(i != n && integers[i] == integers[i + 1]) {
            dp[i][i + 1] = true;
        }
    }

    for(int i = 0; i < n - 2; i++) {
        for(int j = 0; j < n - 2 - i; j++) {
            if(integers[i] == integers[j] && dp[i + 1][
                j - 1]) {
                dp[i][j] = true;
            }
        }
    }

    int m, start, end;
    scanf("%d", &m);
    
    int count = 0;
    for(int i = n - 2; i >= 0; i--) {
        for(int j = i + 2; j < n; j++) {
            if(integers[i] == integers[j] && dp[i + 1][j - 1]) {
                dp[i][j] = true;
            }
        }
    }

    for(int i = 0; i < m; i++) {
        scanf("%d %d", &start, &end);
        printf("%d\n", dp[start - 1][end - 1]);
    }
    return 0;
}