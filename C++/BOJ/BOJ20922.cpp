#include <cstdio>
using namespace std;

int main() {
    int n, k;
    scanf("%d %d", &n, &k);
    int * a = new int[n];
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
    
    int start = 0, end = 0;
    int count[100001] = {0, };
    count[a[0]]++;
    int answer = 1;

    while (end < n - 1) {
        end++;
        count[a[end]]++;
        while (count[a[end]] > k) {
            count[a[start]]--;
            start++;
        }
        answer = answer < end - start + 1 ? end - start + 1 : answer;
    }
    printf("%d\n", answer);
    return 0;
}
