// https://codeforces.com/problemset/problem/550/A

#include <iostream>
#include <string>

int main() {
    std::string s;
    std::cin >> s;
    auto ab = s.find("AB");
    if (ab != std::string::npos) {
        auto ba = s.find("BA", ab + 2);
        if (ba != std::string::npos) {
            std::cout << "YES" << std::endl;
            return 0;
        }
    }
    auto ba = s.find("BA");
    if (ba != std::string::npos) {
        auto ab = s.find("AB", ba + 2);
        if (ab != std::string::npos) {
            std::cout << "YES" << std::endl;
            return 0;
        }
    }
    std::cout << "NO" << std::endl;
    return 0;
}
