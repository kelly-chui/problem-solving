import heapq

heap = []
n = int(input())

for _ in range(n):
    line = map(int, input().split())
    for number in line:
        if len(heap) < n:
            heapq.heappush(heap, number)
        elif heap[0] < number:
            heapq.heappop(heap)
            heapq.heappush(heap, number)

print(heap[0])