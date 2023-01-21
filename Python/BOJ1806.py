n, s = map(int, input().split())
seq = list(map(int, input().split()))

for i in range(1, len(seq)):
    seq[i] = seq[i - 1] + seq[i]

ans = len(seq)
sum = 0
low = 0
high = 0

print(seq)

if seq[n - 1] < s:
    print(0)
else:
    while high < n:
        if low == 0:
            sum = seq[high]
        else:
            sum = seq[high] - seq[low - 1]
        
        if sum >= s:
            if ans > high - low + 1:
                ans = high - low + 1
            low += 1
        else:
            high += 1

print(ans)
