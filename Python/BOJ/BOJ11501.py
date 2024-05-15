t = int(input())
for _ in range(t):
    n = int(input())
    prices = list(map(int, input().split()))
    prices.reverse()
    answer = 0
    max_price = 0
    for price in prices:
        if price <= max_price:
            answer += (max_price - price)
        else:
            max_price = price
    print(answer)
