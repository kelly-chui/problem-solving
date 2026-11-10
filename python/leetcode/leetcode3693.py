# https://leetcode.com/problems/climbing-stairs-ii

import heapq

class Solution:
    def climbStairs(self, n: int, costs: List[int]) -> int:
        costs = [0] + costs
        heap = []
        costTable = [float("INF")] * (n + 1)
        heapq.heappush(heap, (0, 0))
        costTable[0] = 0
        
        while heap:
            cost, step = heapq.heappop(heap)
            if costTable[step] < cost:
                continue
            for ds in [1, 2, 3]:
                newStep = step + ds
                if newStep > n:
                    continue
                jumpCost = costs[newStep] + ((newStep - step) ** 2)
                if cost + jumpCost >= costTable[newStep]:
                    continue
                costTable[newStep] = cost + jumpCost
                heapq.heappush(heap, (costTable[newStep], newStep))
        return costTable[n]
