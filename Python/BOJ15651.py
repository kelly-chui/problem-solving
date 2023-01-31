def backTracking():
    if len(seq) == m:
        for i in range(m):
            print(seq[i], end = "\n" if i == m - 1 else " ")
        return
    else:
        for i in range(1, n + 1):
            seq.append(i)
            backTracking()
            seq.pop()

n, m = map(int, input().split())
seq = []
backTracking()
