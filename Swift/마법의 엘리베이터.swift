import Foundation

func solution(_ storey:Int) -> Int {
    var answer = 0
    var storey = storey
    while storey > 0 {
        let n = storey % 10
        if n > 5 {
            answer += 10 - n
            storey += 10 - n
        } else if n < 5 {
            answer += n
            storey -= n
        } else {
            if (storey / 10) % 10 >= 5 {
                answer += (10 - n)
                storey += (10 - n)
            } else {
                answer += n
                storey -= n
            }
        }
        storey /= 10
    }
    return answer
}
