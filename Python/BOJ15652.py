def backTracking():
    if len(seq) == m:
        for i in range(m):
            print(seq[i], end = "\n" if i == m - 1 else " ")
        return
    for i in range(1, n + 1):
        if not seq:
            seq.append(i)
            backTracking()
            seq.pop()
        elif i >= seq[-1]:
            seq.append(i)
            backTracking()
            seq.pop()

n, m = map(int, input().split())
seq = []
backTracking()
