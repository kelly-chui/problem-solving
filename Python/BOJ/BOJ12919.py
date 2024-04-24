def recur(str):
    if str == s:
        print(1)
        exit()
    if len(str) < len(s):
        return
    if str[-1] == "A":
        recur(str[:-1])
    if str[0] == "B":
        recur(str[1:][::-1])

s = input()
t = input()
recur(t)
print(0)