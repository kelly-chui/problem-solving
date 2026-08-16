// https://leetcode.com/problems/stone-game-ix

class Solution {
    func stoneGameIX(_ stones: [Int]) -> Bool {
        var count = [Int](repeating: 0, count: 3)
        for stone in stones {
            count[stone % 3] += 1
        }
        let count0 = count[0]
        let count1 = count[1]
        let count2 = count[2]
        if count0 % 2 == 0 {
            return count1 > 0 && count2 > 0
        }
        return abs(count1 - count2) > 2
    }
}
