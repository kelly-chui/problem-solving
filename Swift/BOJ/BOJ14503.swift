func rotate(_ direction: Int) -> Int {
    return direction - 1 >= 0 ? direction - 1 : 3
}

var nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let rcd = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var (r, c, d) = (rcd[0], rcd[1], rcd[2])
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var drctDict = [0: (-1, 0), 1: (0, 1), 2: (1, 0), 3: (0, -1)]

var answer = 0

while true {
    if graph[r][c] == 0 {
        graph[r][c] = 2
        answer += 1
    }
    var isClean = true
    for move in [(-1, 0), (0, 1), (1, 0), (0, -1)] {
        let newR = r + move.0
        let newC = c + move.1
        if newR < 0 || newR >= n || newC < 0 || newC >= m {
            continue
        }
        if graph[newR][newC] == 0 {
            isClean = false
            break
        }
    }
    if isClean {
        let move = drctDict[d]!
        let newR = r - move.0
        let newC = c - move.1
        if newR < 0 || newR >= n || newC < 0 || newC >= m {
            break
        }
        if graph[newR][newC] != 1 {
            (r, c) = (newR, newC)
            continue
        }
        break
    } else {
        d = rotate(d)
        let move = drctDict[d]!
        let newR = r + move.0
        let newC = c + move.1
        if newR < 0 || newR >= n || newC < 0 || newC >= m {
            continue
        }
        if graph[newR][newC] == 0 {
            (r, c) = (newR, newC)
        }
    }
}

print(answer)