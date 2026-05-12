// https://leetcode.com/problems/minimum-initial-energy-to-finish-tasks

class Solution {
    func minimumEffort(_ tasks: [[Int]]) -> Int {
        var answer = 0
        var current = 0
        let sortedTasks = tasks.sorted { return $0[1] - $0[0] > $1[1] - $1[0] }
        for task in sortedTasks {
            let (actual, minimum) = (task[0], task[1])
            if current < minimum {
                answer += minimum - current
                current = minimum
            }
            current -= actual
        }
        return answer
    }
}
