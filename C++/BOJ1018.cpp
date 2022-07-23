//
// main.cpp
// BOJ1018
//
// Created by Kelly Chui on 2022/07/23.
//

#include <iostream>
#include <algorithm>
#include <cstring>

int checkBoard(char board[8][8]) {

	int bChange = 0;
	int wChange = 0;
	//B start
	char point = 'B';
	for (int i = 0; i < 8; i++) {
		for (int j = 0; j < 8; j++) {
			if (board[i][j] != point) {
				bChange++;
			}

			if (point == 'W' && j != 7) {
				point = 'B';
			}
			else if (point == 'B' && j != 7) {
				point = 'W';
			}
		}
	}

	//W start
	point = 'W';
	for (int i = 0; i < 8; i++) {
		for (int j = 0; j < 8; j++) {
			if (board[i][j] != point) {
				wChange++;
			}

			if (point == 'W' && j != 7) {
				point = 'B';
			}
			else if (point == 'B' && j != 7) {
				point = 'W';
			}
		}
	}

	if (bChange >= wChange) {
		return wChange;
	}
	else {
		return bChange;
	}
}

int main(void) {
	int m, n;
	char tempboard[8][8];
	int changeNumber = 64;
	int temp;
	std::cin >> n >> m;
	
	char** board = new char* [n]; // vector보단 2차원 array가 편할듯
	for (int i = 0; i < n; i++) {
		board[i] = new char[m];
	}
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			std::cin >> board[i][j];
		}
	}
	
	for (int i = 0; i + 7 <= n - 1; i++) {
		for (int j = 0; j + 7 <= m - 1; j++) {
			for (int k = 0; k <= 7; k++) {
				for (int l = 0; l <= 7; l++) {
					tempboard[k][l] = board[i + k][j + l];
				}
			}
			
			temp = checkBoard(tempboard);
			if (temp < changeNumber) {
				changeNumber = temp;
			}
		}
	}
	std::cout << changeNumber << std::endl;
	return 0;
}