#include <iostream>
#include <string>
#include <vector>

int id(int r, int c, int m) { return r * m + c; }

void dfs(
    int v,
    int& answer,
    std::vector<int>& state,
    const std::vector<int>& destinations
) {
    state[v] = 1;
    int next = destinations[v];
    if (state[next] == 0) {
        dfs(next, answer, state, destinations);
    } else if (state[next] == 1) {
        answer++;
    }
    state[v] = 2;
}

int main() {
    int n, m;
    std::cin >> n >> m;
    std::vector<int> state(n * m, 0);
    std::vector<int> destinations(n * m, 0);
    std::vector<std::string> grid(n);
    for (int idx = 0; idx < n; idx++) std::cin >> grid[idx];
    for (int row = 0; row < n; row++) {
        for (int col = 0; col < m; col++) {
            char ch = grid[row][col];
            int newRow = row, newCol = col;
            if (ch == 'U') newRow--;
            else if (ch == 'D') newRow++;
            else if (ch == 'L') newCol--;
            else if (ch == 'R') newCol++;

            destinations[id(row, col, m)] = id(newRow, newCol, m);
        }
    }
    int answer = 0;
    for (int idx = 0; idx < n * m; idx++) {
        if (state[idx] == 0) dfs(idx, answer, state, destinations);
    }
    std::cout << answer << "\n";
    return 0;
}
