// https://codeforces.com/problemset/problem/492/B

#include <cstdio>
#include <algorithm>

int main() {
    int n, l;
    scanf("%d %d", &n, &l);
    int *a = new int[n];
    for (int idx = 0; idx < n; idx++) {
        scanf("%d", &a[idx]);
    }
    std::sort(a, a + n);
    double d = std::max((double)a[0], (double)(l - a[n - 1]));
    for (int idx = 1; idx < n; idx++) {
        d = std::max(d, (double)(a[idx] - a[idx - 1]) / 2.0);
    }
    printf("%.10f", d);
    delete[] a;
    return 0;
}
