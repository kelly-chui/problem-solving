import sys
sys.setrecursionlimit(1_000_000)

def printPreorder(in_start, in_end, post_start, post_end):
    if in_start > in_end or post_start > post_end:
        return
    else:
        root = postorder[post_end]
        in_root = marker[root]
        left_tree = in_root - in_start

        print(root, end = " ")
        printPreorder(in_start, in_root - 1, post_start, post_start + left_tree - 1)
        printPreorder(in_root + 1, in_end, post_start + left_tree, post_end - 1)

n = int(sys.stdin.readline())
inorder = list(map(int, sys.stdin.readline().split()))
postorder = list(map(int, sys.stdin.readline().split()))
marker = [0 for _ in range(n + 1)]

for idx in range(n):
    marker[inorder[idx]] = idx

printPreorder(0, n - 1, 0, n - 1)
