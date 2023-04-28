import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    for i in 0...w - 1 {
        answer += Int64(Double(h) * Double(i) / Double(w)) * 2
    }

    return answer
}
