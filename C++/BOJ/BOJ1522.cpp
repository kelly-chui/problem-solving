#include <iostream>
#include <string>
using namespace std;

int countChar(string* slice, char character) {
    int count = 0;
    for (char element: *slice) {
        if (element == character) {
            count++;
        }
    }
    return count;
}

int main() {
    string input;
    cin >> input;
    int start = 0, end = countChar(&input, 'a');
    string slice = input.substr(0, end);
    int answer = countChar(&slice, 'b');

    int bCount = answer;
    for (start = 0; start < input.length(); start++) {
        if (input[start % input.length()] == 'b') {
            bCount--;
        }
        if (input[end % input.length()] == 'b') {
            bCount++;
        }
        end++;
        answer = min(answer, bCount);
    }
    cout << answer << endl;
    return 0;
}