# include <iostream>
# include <string>
using namespace std;

bool checkNumber(int n) {
	int nSize = 0;
	int newN = n;
	while (newN > 0) {
		nSize++;
		newN /= 10;
	}
	if (nSize == 1 || nSize == 2) {
		return true;
	}
	int* elements = new int[nSize];
	int idx = 0;
	while (n > 0) {
		elements[idx] = n % 10;
		idx++;
		n /= 10;
	}
	int diff = elements[1] - elements[0];
	for (int i = 2; i < nSize; i++) {
		if (diff != elements[i] - elements[i - 1]) {
			return false;
		}
	}
	return true;
}

int main(void) {
	int n, answer = 0;
	cin >> n;
	for (int i = 1; i <= n; i++) {
		if (checkNumber(i)) {
			answer++;
		}
	}
	cout << answer << endl;
	cout << checkNumber(111) << endl;
	return 0;
}