import Foundation

typealias Route = (to: Int, cost: Int)

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var distances = [[Int]](repeating: [Int](repeating: 987_654_321, count: n + 1), count: n + 1)
    for i in 1...n {
        distances[i][i] = 0
    }
    fares.forEach { fare in
        distances[fare[0]][fare[1]] = fare[2]
        distances[fare[1]][fare[0]] = fare[2]
    }
    for mid in 1...n {
        for start in 1...n {
            guard distances[start][mid] != 987_654_321 else { continue }
            for end in 1...n {
                guard distances[mid][end] != 987_654_321 else { continue }
                distances[start][end] = min(
                    distances[start][end],
                    distances[start][mid] + distances[mid][end]
                )
            }
        }
    }
    var answer = 987_654_321
    for m in 1...n {
        answer = min(answer, distances[s][m] + distances[m][a] + distances[m][b])
    }
    return answer
}
