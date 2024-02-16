#include <stdio.h>
#include <algorithm>
#include <cmath>

using namespace std;

int main() {
    int n;
    scanf("%d", &n);
    if (n == 0) {
        printf("%d\n", 0);
        return 0;
    }
    int scores[300000];
    int truc = round(n * 0.15);
    double answer = 0;

    for (int i = 0; i < n; i++) {
        scanf("%d", &scores[i]);
    }
    sort(scores, scores + n);

    for (int i = truc; i < n - truc; i++) {
        answer += scores[i];
    }

    printf("%d\n", (int)round(answer / (n - 2 * truc)));

    return 0;
}