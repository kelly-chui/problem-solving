import sys

class Node:
    def __init__(self, data, pre = None, post = None):
        self.data = data
        self.pre = pre
        self.post = post

str = sys.stdin.readline().rstrip("\n")

head = Node(data = 0)
cursor = head
for idx in range(0, len(str)):
    cursor.post = Node(data = str[idx], pre = cursor)
    cursor = cursor.post

m = int(sys.stdin.readline())
for _ in range(m):
    query = sys.stdin.readline().split()
    if query[0] == "L":
        if cursor.pre:
            cursor = cursor.pre
    elif query[0] == "D":
        if cursor.post:
            cursor = cursor.post
    elif query[0] == "B":
        if cursor.pre and cursor.post:
            cursor.pre.post = cursor.post
            cursor.post.pre = cursor.pre
            cursor = cursor.pre
        elif not cursor.post:
            cursor.pre.post = cursor.post
            cursor = cursor.pre

    elif query[0] == "P":
        if cursor.pre and cursor.post:
            new_node = Node(data = query[1], pre=cursor, post = cursor.post)
            cursor.post.pre = new_node
            cursor.post = new_node
            cursor = new_node
        elif not cursor.pre:
            new_node = Node(data = query[1], pre = cursor, post = cursor.post)
            cursor.post.pre = new_node
            cursor.post = new_node
            cursor = new_node
        elif not cursor.post:
            new_node = Node(data = query[1], pre = cursor, post = None)
            cursor.post = new_node
            cursor = new_node

cursor = head.post
while cursor:
    print(cursor.data, end = "" if cursor.post else "\n")
    cursor = cursor.post
