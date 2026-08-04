#include <string>
#include <vector>

using namespace std;

bool check(vector<int> &stones, int k, int step) {
    int emptyCount = 0;
    for (int stone : stones) {
        if (stone > step) {
            emptyCount = 0;
        } else {
            emptyCount += 1;
            if (emptyCount >= k) {
                return false;
            }
        }
    }
    return true;
}

int solution(vector<int> stones, int k) {
    int answer = 0;
    int low = 1, high = 200000000;
    while (low < high) {
        int mid = (low + high) / 2;
        if (check(stones, k, mid)) {
            low = mid + 1;
        } else {
            high = mid;
        }
    }
    return high;
}
