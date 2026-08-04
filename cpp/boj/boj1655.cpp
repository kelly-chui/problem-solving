#include <iostream>
#include <vector>
#include <queue>

using namespace std;

int main() {
    int n;
    scanf("%d", &n);
    priority_queue<int, vector<int>> maxHeap;
    priority_queue<int, vector<int>, greater<int>> minHeap;
    for(int i = 0; i < n; i++) {
        int newValue;
        scanf("%d", &newValue);
        if(maxHeap.size() > minHeap.size()) {
            minHeap.push(newValue);
        } else {
            maxHeap.push(newValue);
        }
        if(minHeap.size() > 0 && maxHeap.top() > minHeap.top()) {
            int maxTop = maxHeap.top();
            maxHeap.pop();
            int minTop = minHeap.top();
            minHeap.pop();
            maxHeap.push(minTop);
            minHeap.push(maxTop);
        }
        printf("%d\n", maxHeap.top());
    }
    return 0;
}
