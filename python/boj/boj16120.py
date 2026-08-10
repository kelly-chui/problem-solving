import sys
str = sys.stdin.readline().rstrip()
ppap = ["P", "P", "A", "P"]
stack = []
for char in str:
    stack.append(char)
    if stack[-4:] == ppap:
        stack.pop()
        stack.pop()
        stack.pop()
print("PPAP" if stack == ["P"] or stack == ppap else "NP")
