a, p = map(int, input().split())
seq = [a]

while True:
    element = 0
    for i in str(seq[-1]):
        element += (int(i) ** p)
    if element in seq:
        break
    seq.append(element)

print(seq.index(element))
