import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    func dfs(_ n: Int) {
        if emoticonLength == n {
            var temp = (0, 0)
            for user in users {
                var tempMoney = 0
                for (ratio, emoticon) in zip(ratios, emoticons) {
                    if ratio >= user[0] {
                        tempMoney += Int((Double(emoticon) * Double(100 - ratio)) / Double(100))
                    }
                    if tempMoney >= user[1] {
                        tempMoney = 0
                        temp.0 += 1
                        break
                    }
                }
                temp.1 += tempMoney
            }
            if temp.0 > result.0 {
                result = temp
            } else if temp.0 == result.0 {
                if temp.1 > result.1 {
                    result.1 = temp.1
                }
            }
            return
        }
        for ratio in [10, 20, 30, 40] {
            ratios.append(ratio)
            dfs(n + 1)
            ratios.removeLast()
        }
    }
    
    var emoticonLength = emoticons.count
    var result: (Int, Int) = (0, 0)
    var ratios: [Int] = []
    dfs(0)
    return [result.0, result.1]
}
