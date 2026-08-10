import heapq

def solution(n, works):
    works = [-x for x in works]
    heapq.heapify(works)
    for i in range(n):
        maxWork = heapq.heappop(works)
        if maxWork == 0:
            break
        maxWork += 1
        heapq.heappush(works, maxWork)
    return sum(map(lambda work: work ** 2, works))
