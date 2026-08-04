#include <iostream>
#include <algorithm>

class Paper {
public:
    int height;
    int width;
    Paper() {
        height = 0;
        width = 0;
    }
    Paper(int height, int width) {
        this->height = height;
        this->width = width;
    }
};

int main() {
    int n;
    std::cin >> n;
    Paper * papers = new Paper[n];
    int * dp = new int[n];
    for (int i = 0; i < n; i++) {
        int height, width;
        std::cin >> height >> width;
        papers[i] = Paper(height, width);
        dp[i] = 1;
    }
    std::sort(papers, papers + n, [](const Paper &a, const Paper &b) { 
        return (a.height * a.width) > (b.height * b.width); 
    });
    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (papers[j].height >= papers[i].height && papers[j].width >= papers[i].width) {
                dp[i] = dp[i] > dp[j] + 1 ? dp[i] : dp[j] + 1;
            } else if (papers[j].width >= papers[i].height && papers[j].height >= papers[i].width) {
                dp[i] = dp[i] > dp[j] + 1 ? dp[i] : dp[j] + 1;
            }
        }
    }
    delete[] papers;
    int answer = dp[0];
    for (int i = 1; i < n; i++) {
        answer = answer > dp[i] ? answer : dp[i];
    }
    std::cout << answer << std::endl;
    return 0;
}
