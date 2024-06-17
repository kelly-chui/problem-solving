var graph = [[Int]](repeating: [Int](repeating: 0, count: 101), count: 101)
for _ in 0..<4 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for row in input[1]..<input[3] {
        for column in input[0]..<input[2] {
            graph[row][column] = 1
        }
    }
}

print(graph.map { $0.filter { $0 == 1 }.count }.reduce(0) { $0 + $1 })