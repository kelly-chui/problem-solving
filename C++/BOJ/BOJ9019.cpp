#include <iostream>
#include <string>
#include <queue>
#include <vector>
using namespace std;

void bfs(int a, int b, std::string command) {
	char commands[4] = { 'D', 'S', 'L', 'R' };
	queue<pair<int, string>> bfsQ;
	bfsQ.push({ a, command });
	bool isVisited[10000] = { 0, };
	isVisited[a] = true;

	while (!bfsQ.empty()) {
		pair<int, string> reg = bfsQ.front();
		bfsQ.pop();
		for (char command : commands) {
			int temp_number;
			switch (command) {
			case 'D':
				temp_number = (reg.first * 2) % 10000;
				break;
			case 'S':
				temp_number = reg.first == 0 ? 9999 : reg.first - 1;
				break;
			case 'L':
				temp_number = (reg.first % 1000) * 10 + (reg.first / 1000);
				break;
			case 'R':
				temp_number = (reg.first / 10) + (reg.first % 10) * 1000;
				break;
			}
			if (temp_number == b) {
				cout << reg.second + command << endl;
				queue<pair<int, string>> empty;
				swap(bfsQ, empty);
				return;
			}
			if (!isVisited[temp_number]) {
				isVisited[temp_number] = true;
				bfsQ.push({ temp_number, reg.second + command });
			}
		}
	}
}

int main(void) {
	int t;
	cin >> t;
	for (int i = 0; i < t; i++) {
		int a, b;
		cin >> a >> b;
		bfs(a, b, "");
	}
	return 0;
}