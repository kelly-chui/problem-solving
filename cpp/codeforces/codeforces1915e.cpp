#include <iostream>
#include <vector>
#include <map>

int main() {
    int t;
    std::cin >> t;
    while (t--) {
        int n;
        std::cin >> n;
        std::vector<int> a(n);
        for (int i = 0; i < n; i++) std::cin >> a[i];
        std::map<long long, int> prefixIndex;
        prefixIndex[0] = -1;
        long long prefix = 0;
        bool found = false;
        for (int idx = 0; idx < n; idx++) {
            prefix += (idx % 2 == 0 ? a[idx] : -a[idx]);
            if (prefixIndex.count(prefix)) {
                int start = prefixIndex[prefix] + 1;
                int end = idx;
                if (end - start + 1 >= 2) {
                    found = true;
                    break;
                }
            } else {
                prefixIndex[prefix] = idx;
            }
        }
        std::cout << (found ? "YES" : "NO") << "\n";
    }
    return 0;
}
