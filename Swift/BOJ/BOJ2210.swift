func dfs(_ root: (Int, Int)) {
    if temp.count == 6 {
        seq.insert(temp.joined())
        return
    }
    
    for move in moves {
        let next = (root.0 + move.0, root.1 + move.1)
        if next.0 < 0 || next.0 >= 5 || next.1 < 0 || next.1 >= 5 {
            continue
        }
        temp.append(graph[next.0][next.1])
        dfs(next)
        temp.removeLast()
    }
}

var graph = [[String]]()
var seq = Set<String>()
var temp = [String]()
let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
for _ in 0..<5 {
    graph.append(readLine()!.split(separator: " ").map { String($0) })
}

for row in 0..<5 {
    for column in 0..<5 {
        temp.append(graph[row][column])
        dfs((row, column))
        temp.removeLast()
    }
}

print(seq.count)
