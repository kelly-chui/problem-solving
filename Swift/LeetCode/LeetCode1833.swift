// https://leetcode.com/problems/maximum-ice-cream-bars

class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var count = [Int](repeating: 0, count: costs.max()! + 1)
        for cost in costs {
            count[cost] += 1
        }
        var answer = 0
        var currentCoins = coins
        for cost in 1..<count.count {
            guard count[cost] != 0 else { continue }
            let canBuy = min(count[cost], currentCoins / cost)
            answer += canBuy
            currentCoins -= canBuy * cost
            if currentCoins < cost { break }
        }
        return answer
    }
}
