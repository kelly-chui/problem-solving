import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict: [Int: Int] = [: ]
    var arr: [Int] = []
    var answer = 0
    
    for t in tangerine {
        if dict[t] == nil {
            dict[t] = 1
        } else {
            dict[t]! += 1
        }
    }
    
    for (_, value) in dict {
        arr.append(value)
    }
    
    arr.sort { $0 > $1 }
    
    for idx in 0..<arr.count {
        if idx != 0 {
            arr[idx] = arr[idx] + arr[idx - 1]
        }
        if arr[idx] >= k {
            answer = idx + 1
            break
        }
    }
    
    return answer
}
