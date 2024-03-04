import Foundation

func dp(_ i: Int) -> Int {
    if dpTable[i] == -1 {
        if let preOrders = graph[i] {
            var maxTemp = 0
            for building in preOrders {
                maxTemp = max(maxTemp, dp(building))
            }
            dpTable[i] = maxTemp + d[i - 1]
        } else {
            dpTable[i] = d[i - 1]
        }
    }
    return dpTable[i]
}

var t = Int(readLine()!)!
var d = [Int]()
var dpTable = [Int]()
var graph: [Int: [Int]] = [:]
for _ in 0..<t {
    (graph, dpTable, d) = ([:], [], [])
    let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, k) = (nk[0], nk[1])
    d = readLine()!.split(separator: " ").map { Int(String($0))! }
    for _ in 0..<k {
        let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[xy[1], default: []].append(xy[0])
    }
    let w = Int(readLine()!)!
    dpTable = [Int](repeating: -1, count: n + 1)
    print(dp(w))
}
