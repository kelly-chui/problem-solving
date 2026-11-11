// https://leetcode.com/problems/minimum-cost-to-acquire-required-items

class Solution {
    func minimumCost(_ cost1: Int, _ cost2: Int, _ costBoth: Int, _ need1: Int, _ need2: Int) -> Int {
        func calculate(_ both: Int) -> Int {
            let remaining1 = max(0, need1 - both)
            let remaining2 = max(0, need2 - both)
            return costBoth * both
                + cost1 * remaining1
                + cost2 * remaining2
        }
        return min(
            calculate(0),
            calculate(min(need1, need2)),
            calculate(max(need1, need2))
        )
    }
}
