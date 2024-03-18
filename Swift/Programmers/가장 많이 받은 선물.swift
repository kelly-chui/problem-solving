import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var answer = 0
    var dict = Dictionary(uniqueKeysWithValues: zip(friends, 0..<friends.count))
    var giftCount = [Int](repeating: 0, count: friends.count)
    var sendTable = [[Int]](repeating: [Int](repeating: 0, count: friends.count), count: friends.count)
    
    for gift in gifts {
        let split = gift.split(separator: " ").map { dict[String($0)]! }
        let (sender, receiver) = (split[0], split[1])
        sendTable[sender][receiver] += 1
        giftCount[sender] += 1
        giftCount[receiver] -= 1
    }
    
    for i in 0..<friends.count {
        var count = 0
        for j in 0..<friends.count {
            if i == j { continue }
            if sendTable[i][j] > sendTable[j][i] {
                count += 1
            } else if sendTable[i][j] == sendTable[j][i] && giftCount[i] > giftCount[j] {
                count += 1
            }
        }
        answer = max(answer, count)
    }
    
    return answer
}
