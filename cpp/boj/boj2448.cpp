#include <stdio.h>
#include <vector>
#include <string>

using namespace std;

vector<string> recur(int height) {
    if (height == 3) {
        return {"  *  ", " * * ", "*****"};
    }

    string side(height / 2, ' ');
    vector<string> element = recur(height / 2);
    vector<string> result;

    for (int idx = 0; idx < height / 2; ++idx) {
        result.push_back(side + element[idx] + side);
    }

    for (int idx = 0; idx < height / 2; ++idx) {
        result.push_back(element[idx] + " " + element[idx]);
    }

    return result;
}

int main() {
    int n;
    scanf("%d", &n);
    vector<string> pattern = recur(n);

    for (const string& line : pattern) {
        printf("%s\n", line.c_str());
    }
    return 0;
}
