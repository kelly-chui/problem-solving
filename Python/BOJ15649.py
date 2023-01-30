def dfs():
    if len(sequences) == m:
        for i in range(m):
            print(sequences[i], end = "")
            if i != m - 1:
                print(" ", end = "")
        print()
        return
    
    for i in range(1, n + 1):
        if i not in sequences:
            sequences.append(i)
            dfs()
            sequences.pop()

n, m = map(int, input().split())
sequences = []
dfs()