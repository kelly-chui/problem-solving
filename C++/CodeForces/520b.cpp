// https://codeforces.com/problemset/problem/520/B

#include <iostream>
#include <vector>
#include <queue>

int bfs(int n, int m) {
    std::queue<int> q;
    std::vector<int> clickCount(m * 2, -1);
    q.push(n);
    clickCount[n] = 0;

    while (!q.empty()) {
        int current = q.front();
        q.pop();
        for (int next: {current * 2, current - 1}) {
            if (next < 0 || next >= (int)clickCount.size()) { continue; }
            if (clickCount[next] >= 0) { continue; }
            clickCount[next] = clickCount[current] + 1;
            if (next == m) { return clickCount[m]; }
            q.push(next);
        }
    }
    return clickCount[m];
}

int main() {
    int n, m;
    std::cin >> n >> m;
    std::cout << (n >= m ? n - m : bfs(n, m)) << std::endl;
    return 0;
}
