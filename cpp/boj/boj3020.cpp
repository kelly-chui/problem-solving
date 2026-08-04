#include <stdio.h>
#include <vector>
#include <algorithm>
using namespace std;

int lower_bound(vector<int>& vec, int height) {
    int low = 0, high = vec.size();
    while(low < high) {
        int mid = low + (high - low) / 2;
        if(vec[mid] < height) {
            low = mid + 1;
        } else if(vec[mid] >= height) {
            high = mid;
        }
    }
    return high;
}

int main() {
    int n, h;
    vector<int> top, bottom;
    scanf("%d %d", &n, &h);
    for(int order = 0; order < n; order++) {
        int length;
        scanf("%d", &length);
        if(order % 2 == 0) {
            bottom.push_back(length);
        } else {
            top.push_back(length);
        }
    }
    sort(bottom.begin(), bottom.end());
    sort(top.begin(), top.end());
    int min = 987654321, count = 0;
    for(int sector = 1; sector <= h; sector++) { 
        int num_of_bottom_obstacles = bottom.size() - lower_bound(bottom, sector);
        int num_of_top_obstacles = top.size() - lower_bound(top, h - sector + 1);
        int num_of_obstacles = num_of_bottom_obstacles + num_of_top_obstacles;
        if(num_of_obstacles < min) {
            min = num_of_obstacles;
            count = 1;
        } else if(num_of_obstacles == min) {
            count++;
        }
    }
    printf("%d %d\n", min, count);
    return 0;
}
