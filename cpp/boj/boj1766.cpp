#include <cstdio>
#include <vector>
#include <queue>
#include <functional>

int main() {
    int n, m;
    scanf("%d %d", &n, &m);
    std::vector<std::vector<int>> graph(n + 1);
    std::vector<int> pinIn(n + 1, 0);
    std::priority_queue<int, std::vector<int>, std::greater<int>> pq;
    std::vector<int> result;
    for (int i = 0; i < m; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        graph[a].push_back(b);
        pinIn[b]++;
    }
    for (int i = 1; i <= n; i++) {
        if (pinIn[i] == 0) pq.push(i);
    }
    while (!pq.empty()) {
        int cur = pq.top(); 
        pq.pop();
        result.push_back(cur);
        for (int nxt : graph[cur]) {
            pinIn[nxt]--;
            if (pinIn[nxt] == 0) {
                pq.push(nxt);
            }
        }
    }
    for (int i = 0; i < (int)result.size(); i++) {
        if (i) printf(" ");
        printf("%d", result[i]);
    }
    printf("\n");
    return 0;
}
