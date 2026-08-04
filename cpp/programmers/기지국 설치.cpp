#include <iostream>
#include <vector>
using namespace std;

int solution(int n, vector<int> stations, int w) {
    int answer = 0;
    int start = 1;
    int cover = 2 * w + 1;
    for (int i = 0; i < stations.size(); i++) {
        int end = stations[i] - w - 1;
        if (end >= start) {
            int length = end - start + 1;
            answer += (length + cover - 1) / cover;
        }
        start = stations[i] + w + 1;
    }
    if (start <= n) {
        int length = n - start + 1;
        answer += (length + cover - 1) / cover;
    }
    return answer;
}
