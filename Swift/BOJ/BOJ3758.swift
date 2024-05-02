typealias totalScore = (total: Int, queryCount: Int, lastQuery: Int)

let t = Int(readLine()!)!
for _ in 0..<t {
    let nktm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, k, t, m) = (nktm[0], nktm[1], nktm[2] - 1, nktm[3])
    var scoreBoard = [[Int]](repeating: [Int](repeating: 0, count: k + 1), count: n) 
    var result = [totalScore](repeating: (0, 0, 0), count: n)
    for queryNum in 0..<m {
        let ijs = readLine()!.split(separator: " ").map { Int(String($0))! } 
        let (i, j, s) = (ijs[0] - 1, ijs[1], ijs[2])
        if scoreBoard[i][j] < s {
            result[i].total += (s - scoreBoard[i][j])
            scoreBoard[i][j] = s
        } 
        result[i].lastQuery = queryNum
        result[i].queryCount += 1
    }
    let myteam = result[t]
    result.sort { 
        if $0.total != $1.total {
            return $0.total > $1.total
        } else if $0.queryCount != $1.queryCount {
            return $0.queryCount < $1.queryCount
        } else {
            return $0.lastQuery < $1.lastQuery
        }
    }
    for rank in 0..<n {
        if result[rank] == myteam {
            print(rank + 1)
            break
        }
    }
}