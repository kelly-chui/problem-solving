#include <iostream>
#include <string>
#include <vector>

bool check(const std::vector<std::string>& arr, const std::string& explosion) {
    std::string joined = "";
    for (const std::string& s : arr) {
        joined += s;
    }
    if (joined == explosion) {
        return true;
    }
    return false;
}

int main() {
    std::string str;
    std::cin >> str;

    std::vector<std::string> input;
    for (char c : str) {
        input.push_back(std::string(1, c));
    }

    std::string explosion;
    std::cin >> explosion;
    int eLength = explosion.length();

    std::vector<std::string> stack;
    for (const std::string& c : input) {
        stack.push_back(c);
        if (stack.size() >= eLength && check(std::vector<std::string>(stack.end() - eLength, stack.end()), explosion)) {
            stack.erase(stack.end() - eLength, stack.end());
        }
    }

    if (stack.empty()) {
        std::cout << "FRULA" << std::endl;
    }
    else {
        for (const std::string& s : stack) {
            std::cout << s;
        }
        std::cout << std::endl;
    }

    return 0;
}
