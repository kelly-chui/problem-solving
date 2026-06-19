// https://leetcode.com/problems/minimum-cost-of-buying-candies-with-discount

class Solution {
    func minimumCost(_ cost: [Int]) -> Int {
        var answer = 0
        let sortedCost = cost.sorted { $0 > $1 }
        for (idx, value) in sortedCost.enumerated() {
            guard idx % 3 != 2 else { continue }
            answer += value
        }
        return answer
    }
}
