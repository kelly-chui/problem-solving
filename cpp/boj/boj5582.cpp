# include <iostream>
# include <algorithm>
# include <string>

using namespace std;

int main() {
    string a, b;
    int answer = 0;
    cin >> a >> b;
    int a_Length = (int)a.length();
    int b_Length = (int)b.length();
    int** dp = new int*[a_Length];
    for(int index = 0; index < a_Length; index++) {
        dp[index] = new int[b_Length];
    }
    for (int a_Index = 0; a_Index < a_Length; a_Index++) {
        for (int b_Index = 0; b_Index < b_Length; b_Index++) {
            if (a[a_Index] == b[b_Index]) {
                if (a_Index == 0 || b_Index == 0) {
                    dp[a_Index][b_Index] = 1;
                } else {
                    dp[a_Index][b_Index] = dp[a_Index - 1][b_Index - 1] + 1;
                }
                if (dp[a_Index][b_Index] > answer) {
                    answer = dp[a_Index][b_Index];
                }
            } else {
                dp[a_Index][b_Index] = 0;
            }
        }
    }
    cout << answer << endl;
    return 0;
}
