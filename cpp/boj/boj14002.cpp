#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main(void) {
    int n, ai, max;
    vector<int> a, order, lis;
    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> ai;
        a.push_back(ai);
    }
    order = vector<int>(n, 1);

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (a[i] > a[j] && order[i] <= order[j]) {
                order[i] = order[j] + 1;
            }
        }
    }

    max = *max_element(order.begin(), order.end());
    cout << max << endl;

    for (int i = n - 1; i >= 0; i--) {
        if (order[i] == max) {
            lis.push_back(a[i]);
            max--;
        }
    }

    while (!lis.empty()) {
        cout << lis.back() << " ";
        lis.pop_back();
    }

    return 0;
}
