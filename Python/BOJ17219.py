import sys

n, m = map(int, sys.stdin.readline().split())
dictionary = dict()
for _ in range(n):
    addr, pwd = sys.stdin.readline().split()
    dictionary[addr] = pwd
for _ in range(m):
    addr = sys.stdin.readline().rstrip()
    print(dictionary[addr])
