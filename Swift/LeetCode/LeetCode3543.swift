// https://leetcode.com/problems/path-existence-queries-in-a-graph-ii

class Solution {
    func pathExistenceQueries(_ n: Int, _ nums: [Int], _ maxDiff: Int, _ queries: [[Int]]) -> [Int] {
        let sorted = nums.enumerated().sorted {
            if $0.element == $1.element {
                return $0.offset < $1.offset
            }
            return $0.element < $1.element
        }
        var position = [Int](repeating: 0, count: n)
        for (sortedIndex, item) in sorted.enumerated() {
            position[item.offset] = sortedIndex
        }
        var next = [Int](repeating: 0, count: n)
        var right = 0
        for left in 0..<n {
            right = max(right, left)
            while right + 1 < n,
                  sorted[right + 1].element - sorted[left].element <= maxDiff {
                right += 1
            }
            next[left] = right
        }
        let log = max(1, Int.bitWidth - n.leadingZeroBitCount)
        var jump = Array(
            repeating: [Int](repeating: 0, count: n),
            count: log
        )
        jump[0] = next
        if log >= 2 {
            for level in 1..<log {
                for i in 0..<n {
                    let middle = jump[level - 1][i]
                    jump[level][i] = jump[level - 1][middle]
                }
            }
        }
        return queries.map { query in
            var current = position[query[0]]
            var target = position[query[1]]
            if current > target {
                swap(&current, &target)
            }
            if current == target {
                return 0
            }
            var distance = 0
            for level in stride(from: log - 1, through: 0, by: -1) {
                let destination = jump[level][current]
                if destination > current && destination < target {
                    current = destination
                    distance += 1 << level
                }
            }
            if next[current] >= target {
                return distance + 1
            }
            return -1
        }
    }
}
