# https://leetcode.com/problems/maximum-ice-cream-bars

class Solution:
    def maxIceCream(self, costs: List[int], coins: int) -> int:
        count = [0] * (max(costs) + 1)
        for cost in costs:
            count[cost] += 1
        answer = 0
        for cost in range(1, len(count)):
            if count[cost] == 0:
                continue
            can_buy = min(count[cost], coins // cost)
            answer += can_buy
            coins -= can_buy * cost
            if coins < cost:
                break
        return answer
