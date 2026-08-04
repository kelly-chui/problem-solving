//
// main.cpp
// BOJ17478
//
// Created by Kelly Chui on 2022/07/23.
//

#include <iostream>

void print_(int n) {
	for (int i = 0; i < n; i++) {
		std::cout << "____";
	}
}

void professorSaid(int recursionNumber, int *ref) {
	//std::cout << *recursionNumber << std::endl;
	if (recursionNumber <= *ref) {
		print_(recursionNumber);
		std::cout << "\"����Լ��� ������?\"" << std::endl;
		//std::cout << *recursionNumber << std::endl;
		if (recursionNumber < *ref) {
			print_(recursionNumber);
			std::cout << "\"�� ����. �������� �� �� ����⿡ �̼��� ��� ������ ����� ������ �־���." << std::endl;
			print_(recursionNumber);
			std::cout << "���� ������� ��� �� ���ο��� ������ ������ �߰�, ��� �����Ӱ� ����� �־���." << std::endl;
			print_(recursionNumber);
			std::cout << "���� ���� ��κ� �ǾҴٰ� �ϳ�. �׷��� ��� ��, �� ���ο��� �� ���� ã�ƿͼ� ������.\"" << std::endl;
			professorSaid(recursionNumber + 1, ref);
		}
		else {
			print_(recursionNumber);
			std::cout << "\"����Լ��� �ڱ� �ڽ��� ȣ���ϴ� �Լ����\"" << std::endl;
		}
		print_(recursionNumber);
		std::cout << "��� �亯�Ͽ���." << std::endl;
	}
	else {
	}
}

int main(void) {

	int recursionNumber;
	std::cin >> recursionNumber;
	std::cout << "��� �� ��ǻ�Ͱ��а� �л��� ������ �������� ã�ư� ������." << std::endl;
	professorSaid(0, &recursionNumber);
	return 0;
}
