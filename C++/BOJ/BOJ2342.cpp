#include <iostream>
#include <vector>

int cost(int from, int to) {
    if (from == to) return 1;
    if (from == 0) return 2;
    int diff = abs(from - to);
    if (diff == 2) return 4;
    return 3;
}

int main() {
    const int INF = 987654321;
    int answer = INF;
    std::vector<int> commands;
    while (true) {
        int command;
        std::cin >> command;
        if (command == 0) break;
        commands.push_back(command);
    }
    int numOfCommands = commands.size();
    std::vector<std::vector<std::vector<int>>> dp(
        numOfCommands + 1,
        std::vector<std::vector<int>>(5, std::vector<int>(5, INF))
    );
    dp[0][0][0] = 0;
    for (int i = 0; i < numOfCommands; i++) {
        int command = commands[i];
        for (int l = 0; l < 5; l++) {
            for (int r = 0; r < 5; r++) {
                int current = dp[i][l][r];
                if (current == INF) continue;
                if (command != r) {
                    dp[i + 1][command][r] = dp[i + 1][command][r] > current + cost(l, command) ? current + cost(l, command) : dp[i + 1][command][r];
                }
                if (command != l) {
                    dp[i + 1][l][command] = dp[i + 1][l][command] > current + cost(r, command) ? current + cost(r, command) : dp[i + 1][l][command];
                }
            }
        }
    }
    for (int l = 0; l < 5; l++)
        for (int r = 0; r < 5; r++)
            answer = answer > dp[numOfCommands][l][r] ? dp[numOfCommands][l][r] : answer;

    std::cout << answer << std::endl;
    return 0;
}