import sys
import re

t = int(sys.stdin.readline())
for _ in range(t):
    p = list(sys.stdin.readline())
    n = int(sys.stdin.readline())
    x = sys.stdin.readline().rstrip()[1:-1].split(",")
    isError = False
    start_ptr = 0
    end_ptr = n - 1
    direction = 1
    for function in p:
        if function == "R":
            buffer_ptr = start_ptr
            start_ptr = end_ptr
            end_ptr = buffer_ptr
            direction = -1 if direction == 1 else 1
        elif function == "D":
            if n == 0:
                isError = True
                break
            elif direction == -1:
                n -= 1
                start_ptr -= 1
            elif direction == 1:
                n -= 1
                start_ptr += 1
    
    if isError:
        print("error")
    elif n == 0:
        print("[]")
    elif direction == 1:
        print("[", end="")
        for i in range(start_ptr, end_ptr + 1):
            print(x[i], end="")
            if i != end_ptr:
                print(",", end="")
        print("]")
    else:
        print("[", end="")
        for i in range(start_ptr, end_ptr - 1, -1):
            print(x[i], end="")
            if i != end_ptr:
                print(",", end="")
        print("]")
