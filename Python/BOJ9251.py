first = input()
second = input()

dp = [[0] * (len(second) + 1) for _ in range(len(first) + 1)]

for row in range(1, len(first) + 1):
    for column in range(1, len(second) + 1):
        if first[row - 1] == second[column - 1]:
            dp[row][column] = dp[row - 1][column - 1] + 1
        else:
            dp[row][column] = max(dp[row - 1][column], dp[row][column - 1])
for a in dp:
    print(a)
print(dp[len(first)][len(second)])