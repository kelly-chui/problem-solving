// https://codeforces.com/problemset/problem/118/A

#include <iostream>
#include <string>

int main() {
    std::string s;
    std::cin >> s;
    std::string answer;
    for (char c : s) {
        if (c >= 'A' && c <= 'Z') c += 32;
        if (c == 'a' || c == 'o' || c == 'y' || c == 'e' || c == 'u' || c == 'i') {
            continue;
        } else {
            answer += '.';
            answer += c;
        }
    }
    std::cout << answer << std::endl;
    return 0;
}
