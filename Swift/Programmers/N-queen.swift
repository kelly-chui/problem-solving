import Foundation

func solution(_ n:Int) -> Int {
    func dfs(_ n: Int) {
        func check(_ idx: Int, _ value: Int) -> Bool {
            for i in 0..<board.count {
                let diff = idx - i
                guard board[i] != value - diff && board[i] != value + diff else { return false }
            }
            return true
        }
        
        if board.count == n {
            answer += 1
            return
        }
        
        for v in 0..<n {
            if board.contains(v) {
                continue
            }
            if check(board.count, v) {
                board.append(v)
                dfs(n)
                board.removeLast()
            }
        }
    }
    
    var n = n
    var board: [Int] = []
    var answer = 0
    dfs(n)
    return answer
}
