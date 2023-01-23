import sys

n = int(sys.stdin.readline())
stack10828 = []
for _ in range(n):
    command = list(sys.stdin.readline().split())
    if command[0] == "push":
        stack10828.append(int(command[1]))
    elif command[0] == "pop":
        print(-1 if len(stack10828) == 0 else stack10828.pop())
    elif command[0] == "size":
        print(len(stack10828))
    elif command[0] == "empty":
        print(1 if len(stack10828) == 0 else 0)
    elif command[0] == "top":
        print(-1 if len(stack10828) == 0 else stack10828[-1])
