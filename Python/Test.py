import time

arr = list(range(1, 100_000_000))

startTime = time.time()
count = 0
for i in arr:
    count = count + i
print(count)
print(time.time() - startTime)