//  https://leetcode.com/problems/remove-covered-intervals

class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let n = intervals.count
        let sortedIntervals = intervals.map { ($0[0], $0[1]) }.sorted {
            if $0.0 != $1.0 {
                return $0.0 < $1.0
            } else {
                return $0.1 > $1.1
            }
        }
        var answer = 0
        var maxEnd = 0
        for interval in sortedIntervals where interval.1 > maxEnd {
            answer += 1
            maxEnd = interval.1
        }
        return answer
    }
}
