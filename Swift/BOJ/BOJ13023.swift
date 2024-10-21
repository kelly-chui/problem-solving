import Foundation

func dfs(node: Int, depth: Int) {
    if depth == 4 {
        print(1)
        exit(0)
    } else if let friends = relation[node] {
        for friend in friends {
            guard !isVisited[friend] else {
                continue
            }
            isVisited[friend] = true
            dfs(node: friend, depth: depth + 1)
            isVisited[friend] = false
        }
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var relation = [Int: [Int]]()
var isVisited = [Bool](repeating: false, count: n)
var answer = 0

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    relation[a, default: []].append(b)
    relation[b, default: []].append(a)
}

for num in 0..<n {
    isVisited = [Bool](repeating: false, count: n)
    isVisited[num] = true
    dfs(node: num, depth: 0)
}

print(answer)