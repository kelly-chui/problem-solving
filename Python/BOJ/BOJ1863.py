n = int(input())
stack = []
answer = 0
for _ in range(n):
    _, y = map(int, input().split())
    while stack and stack[-1] > y:
        stack.pop()
        answer += 1
    if not stack or stack[-1] != y:
        stack.append(y)

for element in stack:
    if element != 0:
        answer += 1

print(answer)
