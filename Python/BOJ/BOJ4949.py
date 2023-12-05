ans = []
while True:
    sentences = input()
    if sentences == ".":
        break
    stackBracket = []
    isTrue = True
    for char in sentences:
        if char == "(" or char == "[":
            stackBracket.append(char)
        elif char == ")":
            if not stackBracket or stackBracket[-1] == '[':
                isTrue = False
                break
            elif stackBracket[-1] == "(":
                stackBracket.pop()
        elif char == "]":
            if not stackBracket or stackBracket[-1] == "(":
                isTrue = False
                break
            elif stackBracket[-1] == "[":
                stackBracket.pop()
    ans.append("yes" if isTrue and not stackBracket else "no")
for i in ans:
    print(i)