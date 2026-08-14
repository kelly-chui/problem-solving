// https://codeforces.com/problemset/problem/550/A
// 550A. Two Substrings

#include <iostream>
#include <string>

int main() {
    std::string s;
    std::cin >> s;
    bool hasAB = false;
    bool hasBA = false;
    for (int idx = 0; idx < s.size() - 1; idx++) {
        if (s[idx] == 'A' && s[idx + 1] == 'B') {
            idx++;
            hasAB = true;
        } else if (s[idx] == 'B' && s[idx + 1] == 'A') {
            idx++;
            hasBA = true;
        }
    }
    std::cout << ((hasAB & hasBA) ? "YES" : "NO") << std::endl;
    return 0;
}
