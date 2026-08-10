def dfs(root, mode):
    if tree[root][0] == "." and tree[root][1] == ".":
        print(root, end="")
        return
    
    left = tree[root][0]
    right = tree[root][1]
    if mode == "pre":
        print(root, end="")
        if not left == ".":
            dfs(left, mode)
        if not right == ".":
            dfs(right, mode)
    
    elif mode == "in":
        if not left == ".":
            dfs(left, mode)
        print(root, end="")
        if not right == ".":
            dfs(right, mode)
    
    elif mode == "post":
        if not left == ".":
            dfs(left, mode)
        if not right == ".":
            dfs(right, mode)
        print(root, end="")

tree = dict()
n = int(input())
for _ in range(n):
    parent, left, right = input().split()
    tree[parent] = [left, right]

dfs("A", "pre")
print()
dfs("A", "in")
print()
dfs("A", "post")
print()
