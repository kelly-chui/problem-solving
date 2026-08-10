from bisect import bisect_left
n = int(input())
ports = list(map(int, input().split()))
dp = []
for port in ports:
    idx = bisect_left(dp, port)
    if idx == len(dp):
        dp.append(port)
    else:
        dp[idx] = port
print(len(dp))
