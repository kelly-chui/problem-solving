func findMin(_ row: Int, _ column: Int, _ height: Int) -> Int {
    var min = 987_654_321
    let prevColumn = column + (height - 1)
    if prevColumn >= 0 && prevColumn < 3 {
        for prevHeight in 0..<3 {
            if prevHeight == height { continue }
            if min > dp[row - 1][prevColumn][prevHeight] { 
                min = dp[row - 1][prevColumn][prevHeight]
            }
        }    
    }
    return min
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 987_654_321, count: 3), count: m), count: n)

for column in 0..<m {
    for height in 0..<3 {
        dp[0][column][height] = graph[0][column]
    }
}

for row in 1..<n {
    for column in 0..<m {
        for height in 0..<3 {
            dp[row][column][height] = findMin(row, column, height) + graph[row][column]
        }
    }
}

print(dp[n - 1].map { $0.min()! }.min()!)