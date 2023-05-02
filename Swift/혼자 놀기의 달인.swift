import Foundation

func solution(_ cards:[Int]) -> Int {
    
    func dfs(_ n: Int, _ idx: Int) {
        if isVisited[n] == 0 {
            isVisited[n] = idx
            scoreBoard[idx] += 1
            dfs(cards[n - 1], idx)
        }
    }
    
    var scoreBoard = [Int](repeating: 0, count: cards.count + 1)
    var isVisited = [Int](repeating: 0, count: cards.count + 1)
    var idx = 1
    var boxes: [Int] = []
    for i in 1...cards.count {
        if isVisited[i] == 0 {
            dfs(cards[i - 1], idx)
            idx += 1
        }
    }
    
    scoreBoard.sort { $0 > $1 }
    
    var answer = scoreBoard[0] * scoreBoard[1]
    return answer
}
