#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int binarySearch(int n, int t, vector<int>* dpTable) {
    int low = 1, high = n, mid;
    while (low < high) {
        mid = (low + high) / 2;
        if ((*dpTable)[mid] < t) {
            low = mid + 1;
        }
        else {
            high = mid;
        }
    }
    return low;
}

int main(void) {
    int n, ai, bsidx;
    vector<int> a, order, dpTable;
    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> ai;
        a.push_back(ai);
    }
    dpTable = vector<int>(n + 1, 1000000001);
    dpTable[0] = 0;

    for (int i = 0; i < n; i++) {
        bsidx = binarySearch(n, a[i], &dpTable);
        if (dpTable[bsidx] > a[i]) {
            dpTable[bsidx] = a[i];
        }
        order.push_back(bsidx);
    }

    int max = *max_element(order.begin(), order.end());
    cout << max << endl;
    
    vector<int> lis;
    for (int i = n - 1; i >= 0; i--) {
        if (order[i] == max) {
            lis.push_back(a[i]);
            max--;
        }
    }
    
    for (int i = lis.size() - 1; i >= 0; i--) {
        cout << lis[i] << " ";
    }

    return 0;
}
