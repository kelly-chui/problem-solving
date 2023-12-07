//
// main.cpp
// BOJ2108
//
// Created by Kelly Chui on 2022/07/23.
//

#include <iostream>
#include <algorithm>
#include <vector>
#include <numeric>

bool descent(int a, int b) {
	return a > b;
}

int findMode(std::vector<int> numbers) {
	int temparray[8001] = {0, };
	std::vector<int> modeVect;

	for (int i = 0; i < numbers.size(); i++) {
		temparray[numbers[i] + 4000]++;
	}
	int mode = * std::max_element(temparray, temparray + 8001);

	for (int i = 0; i < 8001; i++) {
		if (temparray[i] == mode) {
			modeVect.push_back(i - 4000);
		}
	}

	if (modeVect.size() >= 2) {
		std::sort(modeVect.begin(), modeVect.end());
		return modeVect[1];
	}
	else {
		return modeVect[0];
	}
}

double calAvg(std::vector<int> numbers, int n) {
	int total = 0;
	for (int i = 0; i < numbers.size(); i++) {
		total = total + numbers[i];
		std::cout << "total" << total << std::endl;
	}
	return total / (double)n;
}

int main(void) {
	int n;
	int temp;
	std::vector<int> numbers;
	
	std::cin >> n;

	for (int i = 0; i < n; i++) {
		std::cin >> temp;
		numbers.push_back(temp);
	}
	std::sort(numbers.begin(), numbers.end());
	
	// »ê¼úÆò±Õ
	//std::cout.precision(2);
	std::cout << floor(calAvg(numbers, n) + 0.5) << std::endl;
	// Áß¾Ó°ª
	std::cout << numbers[int(n / 2)] << std::endl;
	// ÃÖºó°ª
	std::cout << findMode(numbers) << std::endl;
	// ¹üÀ§
	std::cout << numbers.back() - numbers.front() << std::endl;
	return 0;
}