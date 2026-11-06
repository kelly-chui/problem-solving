// https://leetcode.com/problems/count-zero-request-servers

class Solution {
    func countServers(_ n: Int, _ logs: [[Int]], _ x: Int, _ queries: [Int]) -> [Int] {
        var sortedLogs = logs.map {
            ($0[0], $0[1])
        }.sorted {
            $0.1 < $1.1
        }
        var sortedQueries = queries.enumerated().sorted { $0.element < $1.element }
        var processingServers = [Int: Int]()
        var start = 0
        var end = 0
        var answer = [Int](repeating: 0, count: queries.count)

        for (originalIdx, query) in sortedQueries {
            let low = query - x
            let high = query
            while end < sortedLogs.count && sortedLogs[end].1 <= high {
                processingServers[sortedLogs[end].0, default: 0] += 1
                end += 1
            }
            while start < sortedLogs.count && sortedLogs[start].1 < low {
                processingServers[sortedLogs[start].0, default: 0] -= 1
                if processingServers[sortedLogs[start].0]! == 0 {
                    processingServers[sortedLogs[start].0] = nil
                }
                start += 1
            }
            answer[originalIdx] = n - processingServers.count
        }
        return answer
    }
}
