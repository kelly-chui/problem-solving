#include <iostream>

int main() {
    int n;
    int antonia = 100, david = 100;
    std::cin >> n;
    for (int i = 0; i < n; i++) {
        int dice1, dice2;
        std:: cin >> dice1 >> dice2;
        if (dice1 > dice2) {
            david -= dice1;
        } else if (dice1 < dice2) {
            antonia -= dice2;
        }
    }
    std::cout << antonia << std::endl << david << std::endl;
    return 0;
}
