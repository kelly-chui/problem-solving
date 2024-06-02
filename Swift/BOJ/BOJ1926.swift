func dfs(_ current: (Int, Int), _ count: inout Int) {
    count += 1
    for move in moves {
        let next = (current.0 + move.0, current.1 + move.1)
        if next.0 < 0 || next.0 >= n || next.1 < 0 || next.1 >= m {
            continue
        }
        if isVisited[next.0][next.1] {
            continue
        }
        if graph[next.0][next.1] == 0 {
            continue
        }
        isVisited[next.0][next.1] = true
        dfs(next, &count)
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]]()

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
var answer = (0, 0)

for row in 0..<n {
    for column in 0..<m {
        if graph[row][column] == 1 && !isVisited[row][column] {
            var count = 0
            isVisited[row][column] = true
            dfs((row, column), &count)
            answer.0 += 1
            answer.1 = max(answer.1, count)
        }
    }
}

print(answer.0)
print(answer.1)