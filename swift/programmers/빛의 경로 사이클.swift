import Foundation

func solution(_ grid:[String]) -> [Int] {
    let aGrid = grid.map { $0.map { String($0) } }
    let (r, l) = (grid.count, grid.first!.count)
    let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    let turn: [String: Int] = ["S": 0, "L": -1, "R": 1]
    var isVisited = [[[Bool]]](
        repeating: [[Bool]](
            repeating: [Bool](
                repeating: false,
                count: 4
            ),
            count: l
        ),
        count: r
    )
    var answer = [Int]()
    for i in 0..<r {
        for j in 0..<l {
            for k in 0...3 {
                guard !isVisited[i][j][k] else { continue }
                var current = (i, j, k)
                var length = 0
                while true {
                    guard !isVisited[current.0][current.1][current.2] else { break }
                    isVisited[current.0][current.1][current.2] = true
                    length += 1
                    let newDirection = (current.2 + turn[aGrid[current.0][current.1]]! + 4) % 4
                    let newRow = (current.0 + moves[newDirection].0 + r) % r
                    let newColumn = (current.1 + moves[newDirection].1 + l) % l
                    current = (newRow, newColumn, newDirection)
                }
                answer.append(length)
            }
        }
    }
    return answer.sorted()
}
