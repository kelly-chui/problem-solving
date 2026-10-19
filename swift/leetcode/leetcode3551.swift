// https://leetcode.com/problems/minimum-swaps-to-sort-by-digit-sum

class Solution {
    func minSwaps(_ nums: [Int]) -> Int {
        struct NumNode: Hashable {
            let digitSum: Int
            let origin: Int
        }
        let newNums = nums.map { num in
            let digitSum = String(num).compactMap { Int(String($0)) }.reduce(0, +)
            return NumNode(digitSum: digitSum, origin: num)
        }
        let sortedNums = newNums.sorted {
            ($0.digitSum, $0.origin) < ($1.digitSum, $1.origin)
        }
        var positionTable = [NumNode: Int]()
        sortedNums.enumerated().forEach { idx, value in
            positionTable[value] = idx
        }
        var answer = 0
        var isVisited = [Bool](repeating: false, count: nums.count)
        newNums.indices.forEach { idx in
            guard !isVisited[idx] else { return }
            var currentIndex = idx
            var cycleLen = 0
            while !isVisited[currentIndex] {
                isVisited[currentIndex] = true
                currentIndex = positionTable[newNums[currentIndex]]!
                cycleLen += 1
            }
            answer += cycleLen - 1
        }
        return answer
    }
}
