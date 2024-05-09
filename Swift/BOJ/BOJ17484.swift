let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}
