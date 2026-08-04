#include <iostream>
#include <map>

int main() {
    int n;
    std::cin >> n;
    std::map<std::string, int> db;
    while (n--) {
        std::string name;
        std::cin >> name;
        if (db.find(name) != db.end()) {
            db[name]++;
            std::cout << name << db[name] << std::endl;
        } else {
            db[name] = 0;
            std::cout << "OK" << std::endl;
        }
    }
    return 0;
}
