# include <iostream>
# include <cstring>
using namespace std;

int d(int n) {
	int result = 0;
	result += n;
	
	while (n > 0) {
		result += (n % 10);
		n /= 10;
	}
	return result;
}

int main(void) {
	int n = 10001;
	bool *numbers = new bool[n];
	memset(numbers, false, 10001 * sizeof(bool));
	
	for (int idx = 1; idx < n; idx++) {
		if (!numbers[idx]) {
			cout << idx << endl;
			numbers[idx] = true;
			int d_return = idx;
			while (d_return <= 10000) {
				d_return = d(d_return);
				if (d_return > 10000) {
					break;
				} else {
					numbers[d_return] = true;
				}
			}
		}
	}
	return 0;
}