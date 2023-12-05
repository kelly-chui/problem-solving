from collections import deque

n = int(input())
seq = deque()
for _ in range(n):
    command = list(input().split())
    if command[0] == "push_front":
        seq.appendleft(int(command[1]))
    elif command[0] == "push_back":
        seq.append(int(command[1]))
    elif command[0] == "pop_front":
        if seq:
            print(seq.popleft())
        else:
            print(-1)
    elif command[0] == "pop_back":
        if seq:
            print(seq.pop())
        else:
            print(-1)
    elif command[0] == "size":
        print(len(seq))
    elif command[0] == "empty":
        if seq:
            print(0)
        else:
            print(1)
    elif command[0] == "front":
        if seq:
            print(seq[0])
        else:
            print(-1)
    elif command[0] == "back":
        if seq:
            print(seq[-1])
        else:
            print(-1)