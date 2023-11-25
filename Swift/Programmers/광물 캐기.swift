import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    func dfs(_ n: Int, _ remains: [Int]) {
        if n == pickCount {
            var fati = 0
            if newMineral.count > pickCount {
                for idx in 0..<order.count {
                    fati += newMineral[idx][order[idx]]
                }
            } else {
                for idx in 0..<newMineral.count {
                    fati += newMineral[idx][order[idx]]
                }
            }
            answer = min(answer, fati)
            return
        }
        for idx in 0...2 {
            if remains[idx] == 0 {
                continue
            } else {
                var newRemains = remains
                order.append(idx)
                newRemains[idx] -= 1
                dfs(n + 1, newRemains)
                newRemains[idx] += 1
                order.removeLast()
            }
        }
    }
    let dict = ["diamond": 0, "iron": 1, "stone": 2]
    let table = [[1, 1, 1], [5, 1, 1], [25, 5, 1]]
    let pickCount = picks.reduce(0) { $0 + $1 }
    var order: [Int] = []
    var answer = 25 * 50
    var newMineral: [[Int]] = []
    for i in stride(from: 0, to: minerals.count, by: 5) {
        var min5: [Int] = []
        if i + 4 > minerals.count {
            min5 = Array(minerals[i..<minerals.count].map { dict[$0]! })
        } else {
            min5 = Array(minerals[i...i + 4].map { dict[$0]! })
        }
        print(min5)
        var temp: [Int] = []
        for j in 0...2 {
            var fati = 0
            for k in min5 {
                fati += table[j][k]
            }
            temp.append(fati)
        }
        newMineral.append(temp)
    }r
    
    dfs(0, picks)
    return answer
}
