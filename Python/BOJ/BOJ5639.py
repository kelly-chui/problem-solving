import sys
sys.setrecursionlimit(100_000)

def preToPost(array):
    root = array[0]
    if len(array) == 1:
        print(root)
    else:
        for idx in range(1, len(array)):
            if array[idx] > root:
                if idx == 1:
                    right_tree = array[idx:]
                else:
                    left_tree = array[1:idx]
                    right_tree = array[idx:]
                    preToPost(left_tree)
                preToPost(right_tree)
                print(root)
                break
            if idx == len(array) - 1:
                left_tree = array[1:]
                preToPost(left_tree)
                print(root)

pre = []
post = []
while True:
    try:
        node = int(input())
        pre.append(node)
    except:
        break

preToPost(pre)
