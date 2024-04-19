def check(line):
    is_built = [False] * n
    current_height = line[0]
    count = 1
    for idx in range(1, n):
        if current_height == line[idx]:
            count += 1
        elif current_height - line[idx] == 1:
            current_height = line[idx]
            continue
        elif current_height - line[idx] == -1:
            if count >= l:
                for back in range(1, l + 1):
                    if is_built[idx - back]:
                        return False
                    is_built[idx - back] = True
                count = 1
            else:
                return False
            current_height = line[idx]
        else:
            return False

    current_height = line[n - 1]
    count = 1
    for idx in range(n - 2, -1, -1):
        if current_height == line[idx]:
            count += 1
        elif current_height - line[idx] == 1:
            current_height = line[idx]
            continue
        elif current_height - line[idx] == -1:
            if count >= l:
                for back in range(1, l + 1):
                    if is_built[idx + back]:
                        return False
                    is_built[idx + back] = True
                count = 1
            else:
                return False
            current_height = line[idx]
        else:
            return False
    return True

n, l = map(int, input().split())
graph = []
graph_tranposed = [[0] * n for _ in range(n)]
answer = 0

for _ in range(n):
    graph.append(list(map(int, input().split())))

for row in range(n):
    for column in range(n):
        graph_tranposed[row][column] = graph[column][row]

for idx in range(n):
    answer += 1 if check(graph[idx]) else 0
    answer += 1 if check(graph_tranposed[idx]) else 0

print(answer)