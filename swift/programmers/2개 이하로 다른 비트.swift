import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    
    func btd(_ binary: String) -> Int64 {
        let arrayBinary = Array(binary.reversed()).map { Int(String($0))! }
        var d = 0
        var factor = 1
        for i in arrayBinary {
            d += i * factor
            factor *= 2
        }
        return Int64(d)
    }
    
    let binaryNumbers = numbers.map { Array(String(Int($0), radix: 2)).map { String($0) } }
    var answer: [Int64] = []
    
    for number in binaryNumbers {
        let rNumber = Array(number.reversed())
        var isZero = false
        for idx in 0..<number.count {
            if rNumber[idx] == "0" {
                if idx == 0 {
                    var temp = number
                    temp[number.count - 1] = "1"
                    answer.append(btd(temp.joined()))
                    isZero = true
                    break
                } else {
                    var temp = number
                    temp[number.count - 1 - idx] = "1"
                    temp[number.count - idx] = "0"
                    answer.append(btd(temp.joined()))
                    isZero = true
                    break
                }
            }
        }
        if !isZero {
            var temp = number
            temp[0] = "0"
            answer.append(btd("1" + temp.joined()))
        }
    }
    
    return answer
}
