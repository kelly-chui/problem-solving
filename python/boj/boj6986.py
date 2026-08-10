import sys

n, k = map(int, sys.stdin.readline().split())
score = [float(sys.stdin.readline()) for _ in range(n)] 
score.sort()
answer1 = (sum(score[k:n - k])) / (n - 2 * k)
answer2 = (sum(score[k:n - k]) + score[k] * k + score[n - k - 1] * k) / n

print(f"{answer1 + 1e-8:.2f}")
print(f"{answer2 + 1e-8:.2f}")
