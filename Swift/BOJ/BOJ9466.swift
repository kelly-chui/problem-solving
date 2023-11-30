import Foundation

func dfs(root: Int) {
    isVisited[root] = true
    let next = students[root]
    team.append(root)
    if isVisited[next] {
        if team.contains(next) {
            answer -= team[team.firstIndex(of: next)!...].count
        }
    } else {
        dfs(root: next)
    }
}

var T = Int(readLine()!)!
var n = Int()
var students = [Int]()
var isVisited = [Bool]()
var answer = Int()
var team = [Int]()
for _ in 0..<T {
    n = Int(readLine()!)!
    answer = n
    students = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
    isVisited = [Bool](repeating: false, count: n + 1)
    for root in 1...n {
        if !isVisited[root] {
            team = []
            dfs(root: root)
        }
    }
    print(answer)
}
