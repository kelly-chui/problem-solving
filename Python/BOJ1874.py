import sys

nStack = []
commands = []
n = int(sys.stdin.readline())
seq = []
isPossible = True
originSeq = list(range(1, n + 1))
for _ in range(n):
    seq.append(int(sys.stdin.readline()))

print("seq", seq)
print("originSeq", originSeq)

i = 0
for element in seq:
    if len(nStack) == 0:
        nStack.append(originSeq[i])
        commands.append("+")
        i += 1
        while nStack[-1] < element:
            nStack.append(originSeq[i])
            commands.append("+")
            i += 1
        if nStack[-1] == element:
            nStack.pop()
            commands.append("-")
    elif nStack[-1] < element:
        while nStack[-1] < element:
            nStack.append(originSeq[i])
            commands.append("+")
            i += 1
        if nStack[-1] == element:
            nStack.pop()
            commands.append("-")
    elif nStack[-1] == element:
        nStack.pop()
        commands.append("-")
    elif nStack[-1] > element:
        isPossible = False
        break

if isPossible:
    for command in commands:
        print(command)
else:
    print("NO")