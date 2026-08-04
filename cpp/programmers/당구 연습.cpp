#include <string>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> reflectUp(vector<int> point, int m, int n) {   
    return {point[0], 2 * n - point[1]};
}
vector<int> reflectDown(vector<int> point, int m, int n) {
    return {point[0], -point[1]};
}
vector<int> reflectLeft(vector<int> point, int m, int n) {
    return {-point[0], point[1]};
}
vector<int> reflectRight(vector<int> point, int m, int n) {
    return {2 * m - point[0], point[1]};
}
vector<int> reflectLeftUp(vector<int> point, int m, int n) {
    return reflectUp(reflectLeft(point, m, n), m, n);
}
vector<int> reflectLeftDown(vector<int> point, int m, int n) {
    return reflectDown(reflectLeft(point, m, n), m, n);
}
vector<int> reflectRightUp(vector<int> point, int m, int n) {
    return reflectUp(reflectRight(point, m, n), m, n);
}
vector<int> reflectRightDown(vector<int> point, int m, int n) {
    return reflectDown(reflectRight(point, m, n), m, n);
}
int squareDistance(vector<int> pointA, vector<int> pointB) {
    int diffX = pointA[0] - pointB[0];
    int diffY = pointA[1] - pointB[1];
    return diffX * diffX + diffY * diffY;
}

vector<int> solution(int m, int n, int startX, int startY, vector<vector<int>> balls) {
    vector<int> start = {startX, startY};
    vector<int> answer;
    for (auto& ball : balls) {
        int shortestDistance = 987654321;
        int endX = ball[0], endY = ball[1];
        vector<int> end = {endX, endY};
        if (!(startX == endX && startY < endY)) { // 상
            shortestDistance = min(shortestDistance, squareDistance(start, reflectUp(end, m, n)));
        }
        if (!(startX == endX && startY > endY)) { // 하
            shortestDistance = min(shortestDistance, squareDistance(start, reflectDown(end, m, n)));
        }
        if (!(startY == endY && startX > endX)) { // 좌
            shortestDistance = min(shortestDistance, squareDistance(start, reflectLeft(end, m, n)));
        }
        if (!(startY == endY && startX < endX)) { // 우
            shortestDistance = min(shortestDistance, squareDistance(start, reflectRight(end, m, n)));
        }
        
        // 대각선 판정
        if ((m * startY == n * startX) && (m * endY == n * endX)) { // /대각선
            if (endX > startX) { // 좌하
                shortestDistance = min(shortestDistance, squareDistance(start, reflectLeftDown(end, m, n)));
            }
            if (endX < startX) { // 우상
                shortestDistance = min(shortestDistance, squareDistance(start, reflectRightUp(end, m, n)));
            }
        }
        if ((m * startY == m * n + startX * -n) && (m * endY == m * n + endX * -n)) { // \대각선
            if (endX > startX) { // 좌상
                shortestDistance = min(shortestDistance, squareDistance(start, reflectLeftUp(end, m, n)));
            }
            if (endX < startX) { // 우하
                shortestDistance = min(shortestDistance, squareDistance(start, reflectRightDown(end, m, n)));
            }
        }
        answer.push_back(shortestDistance);
    }
    return answer;
}
