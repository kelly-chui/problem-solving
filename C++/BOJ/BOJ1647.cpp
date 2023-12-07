# include <iostream>
# include <algorithm>
# include <vector>

using namespace std;

int find(int a, vector<int>& parent) {
    if (parent[a] != a) {
        parent[a] = find(parent[a], parent);
    }
    return parent[a];
}

void unionValues(int a, int b, vector<int>& parent) {
    int pa = find(a, parent);
    int pb = find(b, parent);
    if (pa < pb) {
        parent[pb] = pa;
    } else {
        parent[pa] = pb;
    }
}

class Heap {
public:
    vector<pair<pair<int, int>, int>> heap;
    
    bool isEmpty() {
        return heap.empty();
    }
    
    void push(pair<pair<int, int>, int> value) {
        heap.push_back(value);
        int curIdx = heap.size() - 1;
        
        while (curIdx > 0 && heap[curIdx].second < heap[(curIdx - 1) / 2].second) {
            swapAt(curIdx, (curIdx - 1) / 2);
            curIdx = (curIdx - 1) / 2;
        }
    }
    
    pair<pair<int, int>, int> pop() {
        pair<pair<int, int>, int> minValue = heap[0];
        swapAt(0, heap.size() - 1);
        heap.pop_back();
        int curIdx = 0;
        
        while (curIdx * 2 + 1 < heap.size()) {
            int lChildIdx = curIdx * 2 + 1;
            int rChildIdx = lChildIdx + 1;
            int mChildIdx = lChildIdx;
            
            if (rChildIdx <= heap.size() - 1 && heap[rChildIdx].second < heap[mChildIdx].second) {
                mChildIdx = rChildIdx;
            }
            
            if (heap[mChildIdx].second < heap[curIdx].second) {
                swapAt(mChildIdx, curIdx);
                curIdx = mChildIdx;
            } else {
                break;
            }
        }
        return minValue;
    }
    
private:
    void swapAt(int a, int b) {
        if (a == b) {
            return;
        }
        pair<pair<int, int>, int> temp = heap[a];
        heap[a] = heap[b];
        heap[b] = temp;
    }
};

int main(void) {
    int n, m;
    cin >> n >> m;
    Heap edges = Heap();
    for (int i = 0; i < m; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        edges.push(make_pair(make_pair(a, b), c));
        edges.push(make_pair(make_pair(b, a), c));
    }
    
    vector<int> parent = {};
    for (int i = 0; i <= n; i++) {
        parent.push_back(i);
    }
    int answer = 0;
    int maxWeight = 0;
    
    while (!edges.isEmpty()) {
        pair<pair<int, int>, int> edge = edges.pop();
        if (find(edge.first.first, parent) != find(edge.first.second, parent)) {
            unionValues(edge.first.first, edge.first.second, parent);
            answer += edge.second;
            if (maxWeight < edge.second) {
                maxWeight = edge.second;
            }
        }
    }
    
    cout << answer - maxWeight << endl;
    return 0;
}
