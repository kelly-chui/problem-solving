import sys

t = int(sys.stdin.readline())
for _ in range(t):
    m, n, x, y = map(int, sys.stdin.readline().split())
    if x > m or y > n:
        print(-1)
        continue
    
    isPossible = False

    while x < m * n + 1:
        if (x % n == y) or (x % n == 0 and n == y):
            isPossible = True
            break
        x += m
    print(x if isPossible else -1)
