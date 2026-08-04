int totalWaviness(int num1, int num2) {
    int answer = 0;
    for (int num = num1; num <= num2; num++) {
        char buffer[20];
        int numArray[20];
        sprintf(buffer, "%d", num);
        int count = 0;
        for (int i = 0; buffer[i] != '\0'; i++) {
            numArray[i] = buffer[i] - '0';
            count++;
        }
        for (int i = 1; i < count - 1; i++) {
            if (numArray[i] > numArray[i - 1] && numArray[i] > numArray[i + 1]) {
                answer += 1;
            } else if (numArray[i] < numArray[i - 1] && numArray[i] < numArray[i + 1]) {
                answer += 1;
            }
        }
    }
    return answer;
}
