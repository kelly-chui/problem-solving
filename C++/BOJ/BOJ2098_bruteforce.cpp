#include <iostream>
#include <vector>

void makeRoute(int n, int last, int distance, int visitedCount, int &best, std::vector<std::vector<int>> &w, std::vector<bool> &isUsed) {
    if (distance >= best) return;
    if (visitedCount == n) {
        if (w[last][0] != 0) {
            int newDistance = distance + w[last][0];
            best = newDistance < best ? newDistance : best;
        }
        return;
    }
    for (int city = 1; city < n; city++) {
        if (isUsed[city]) continue;
        if (w[last][city] == 0) continue;
        isUsed[city] = true;
        makeRoute(n, city, distance + w[last][city], visitedCount + 1, best, w, isUsed);
        isUsed[city] = false;
    }
}

int main() {
    int n;
    std::cin >> n;
    std::vector<std::vector<int>> w(n, std::vector<int>(n));
    std::vector<bool> isUsed(n, false);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            std::cin >> w[i][j];
        }
    }
    isUsed[0] = true;
    int answer = 987654321;
    makeRoute(n, 0, 0, 1, answer, w, isUsed);
    std::cout << ((answer == 987654321) ? -1 : answer) << std::endl;
    return 0;
}
