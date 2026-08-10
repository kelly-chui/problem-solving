// https://leetcode.com/problems/path-existence-queries-in-a-graph-i

class Solution {
    func pathExistenceQueries(_ n: Int, _ nums: [Int], _ maxDiff: Int, _ queries: [[Int]]) -> [Bool] {
        var parent = Array(0..<n)
        func find(_ a: Int) -> Int {
            if parent[a] != a {
                parent[a] = find(parent[a])
            }
            return parent[a]
        }
        func union(_ a: Int, _ b: Int) {
            parent[find(a)] = find(b)
        }
        var start = 0
        var end = 0
        while start < n {
            while end + 1 < n && nums[end + 1] - nums[start] <= maxDiff {
                union(start, end + 1)
                end += 1
            }
            start += 1
            if end < start {
                end = start
            }
        }
        return queries.map { find($0[0]) == find($0[1]) }
    }
}
