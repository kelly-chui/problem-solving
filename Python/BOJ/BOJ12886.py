from collections import deque

def swap(a, b):
    return (b, a)

def bfs(start):
    is_visited = set([])
    queue = deque()
    queue.append(start)
    is_visited.add(start)

    while queue:
        big, small = queue.popleft()
        mid = total - (big + small)
        if big == mid and big == small and small == mid:
            print(1)
            exit()
        for group1, group2 in [(big, small), (mid, small), (big, mid)]:
            if group1 == group2:
                continue
            if group1 < group2:
                group2, group1 = swap(group1, group2)
            group1, group2 = group1 - group2, group2 * 2
            group3 = total - (group2 + group1)
            if (max([group1, group2, group3]), min([group1, group2, group3])) in is_visited:
                continue
            queue.append((max([group1, group2, group3]), min([group1, group2, group3])))
            is_visited.add((max([group1, group2, group3]), min([group1, group2, group3])))
            
a, b, c = map(int, input().split())
total = a + b + c
bfs((max([a, b, c]), min([a, b, c])))
print(0)