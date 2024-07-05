import sys

n = int(sys.stdin.readline())
expectedRanks = []
for _ in range(n):
    expectedRanks.append(int(sys.stdin.readline()))
expectedRanks.sort()

rank = 1
answer = 0

for expectedRank in expectedRanks:
    answer += abs(rank - expectedRank)
    rank += 1

print(answer)