#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main() {
    int n;
    cin >> n;
    string balls;
    cin >> balls;
    
    int answer = 987654321;

    vector<pair<char, char>> colors = {{'R', 'B'}, {'B', 'R'}};
    int count;
    bool checker;

    for (auto color: colors) {
        count = 0;
        checker = false;
        for (int i = n - 1; i >= 0; i--) {
            if (balls[i] == color.first) {
                checker = true;
            }
            if (checker && balls[i] == color.second) {
                count++;
            }
        }
        answer = min(count, answer);

        count = 0;
        checker = false;
        for (int i = 0; i < n; i++) {
            if (balls[i] == color.first) {
                checker = true;
            }
            if (checker && balls[i] == color.second) {
                count++;
            }
        }
        answer = min(count, answer);
    }

    cout << answer << endl;
    return 0;
}
