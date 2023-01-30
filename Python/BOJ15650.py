def backTracking():
    if len(sequences) == m:
        for i in range(m):
            print(sequences[i], end = "")
            if i != m - 1:
                print(" ", end = "")
        print()
        return
    
    for i in range(1, n + 1):
        if len(sequences) == 0:
            sequences.append(i)
            backTracking()
            sequences.pop()
        elif i not in sequences and i > sequences[-1]:
            sequences.append(i)
            backTracking()
            sequences.pop()

n, m = map(int, input().split())
sequences = []
backTracking()