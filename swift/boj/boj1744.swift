import Foundation

let n = Int(readLine()!)!
var positiveSeq = [Int]()
var negativeSeq = [Int]()
var zeroSeq = [Int]()
for _ in 0..<n {
    let element = Int(readLine()!)!
    if element > 0 {
        positiveSeq.append(element)
    } else {
        negativeSeq.append(element)
    }
}
positiveSeq.sort { $0 > $1 }
negativeSeq.sort { $0 < $1 }

var answer = 0
if positiveSeq.count % 2 != 0 {
    answer += positiveSeq[positiveSeq.count - 1]
}
var idx = 0
while idx < positiveSeq.count - 1 {
    if positiveSeq[idx + 1] == 1 {
        answer += positiveSeq[idx] + positiveSeq[idx + 1]
    } else {
        answer += positiveSeq[idx] * positiveSeq[idx + 1]
    }
    idx += 2
}
if negativeSeq.count % 2 != 0 {
    answer += negativeSeq[negativeSeq.count - 1]
}
idx = 0
while idx < negativeSeq.count - 1 {
    answer += negativeSeq[idx] * negativeSeq[idx + 1]
    idx += 2
}
print(answer)
