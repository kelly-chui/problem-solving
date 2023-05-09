import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    func dfs(_ shots: Int, _ Index: Int) {
        if shots == n {
            var scoreIndex = 10
            var (lionScore, apeachScore) = (0, 0)
            for (lion, apeach) in zip(lionShots, info) {
                if lion > apeach {
                    lionScore += scoreIndex
                } else if apeach != 0 && apeach >= lion {
                    apeachScore += scoreIndex
                }
                scoreIndex -= 1
            }
            if lionScore > apeachScore && maxDiff <= lionScore - apeachScore {
                if maxDiff == lionScore - apeachScore {
                    for (rl, ra) in zip(lionShots.reversed(), answer.reversed()) {
                        if rl > ra {
                            answer = lionShots
                            break
                        } else if rl < ra {
                            break
                        }
                    }
                } else {
                    maxDiff = lionScore - apeachScore
                    answer = lionShots
                }
            }
            return
        }
        for idx in Index...10 {
            lionShots[idx] += 1
            dfs(shots + 1, idx)
            lionShots[idx] -= 1
        }
    }
    
    var maxDiff = 0
    var lionShots = [Int](repeating: 0, count: 11)
    var answer = [Int](repeating: 0, count: 11)
    dfs(0, 0)
    return answer == [Int](repeating: 0, count: 11) ? [-1] : answer
}
