n = int(input())
stack4949 = []
for _ in range(n):
    command = list(input().split())

    if command[0] == "push":
        stack4949.append(int(command[1]))
    elif command[0] == "pop":
        print(-1 if len(stack4949) == 0 else stack4949.pop())
    elif command[0] == "size":
        print(len(stack4949))
    elif command[0] == "empty":
        print(1 if len(stack4949) == 0 else 0)
    elif command[0] == "top":
        print(-1 if len(stack4949) == 0 else stack4949[-1])


# push X: 정수 X를 스택에 넣는 연산이다.
# pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
# size: 스택에 들어있는 정수의 개수를 출력한다.
# empty: 스택이 비어있으면 1, 아니면 0을 출력한다.
# top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.