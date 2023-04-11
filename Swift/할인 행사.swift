import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    let sum = number.reduce(0) { $0 + $1 }
    var wantDict: [String: Int] = [: ]
    var answer = 0
    for idx in 0..<want.count {
        wantDict[want[idx]] = idx
    }
    var curList = [Int](repeating: 0, count: number.count)
    var (start, end) = (0, sum - 1)
    
    for idx in 0..<sum {
        if wantDict[discount[idx]] != nil {
            curList[wantDict[discount[idx]]!] += 1
        }
    }
    print(curList)
    if curList.elementsEqual(number) {
        answer += 1
    }
    
    while end < discount.count - 1 {
        if wantDict[discount[end + 1]] != nil {
            curList[wantDict[discount[end + 1]]!] += 1
        }
        if wantDict[discount[start]] != nil {
            curList[wantDict[discount[start]]!] -= 1
        }

        if curList.elementsEqual(number) {
            answer += 1
        }
        start += 1
        end += 1
    }
    
    return answer
}

