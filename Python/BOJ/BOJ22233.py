import sys

n, m = map(int, sys.stdin.readline().split())
memo = set()
for _ in range(n):
    memo.add(sys.stdin.readline().rstrip("\n"))

for _ in range(m):
    tag_list = list(sys.stdin.readline().rstrip("\n").split(","))
    for tag in tag_list:
        if tag in memo:
            memo.remove(tag)
    print(len(memo))
