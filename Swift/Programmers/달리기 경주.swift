import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var rankDict = [String: Int]()
    var rank = 0
    var answer = players
    for player in players {
        rankDict[player] = rank
        rank += 1
    }
    
    for calling in callings {
        let callRank = rankDict[calling]!
        let preRank = callRank - 1
        let prePlayer = answer[preRank]
        answer.swapAt(preRank, callRank)
        rankDict[calling] = preRank
        rankDict[prePlayer] = callRank
    }
    
    return answer
}