import Foundation

func solution(_ s:String) -> Int {
    let arrayS = Array(s).map { String($0) }
    var answer = 0
    
    func recur(_ pointer: Int, _ n: Int) {
        if n == 0 {
            return
        }
        
        if n == 1 {
            answer += 1
            return
        }
        
        var ptr = pointer
        let x = arrayS[ptr]
        var (same, diff) = (0, 0)
        for element in arrayS[pointer...] {
            if element == x {
                same += 1
            } else {
                diff += 1
            }
            if same == diff {
                recur(ptr + 1, s.count - ptr - 1)
                answer += 1
                return
            }
            ptr += 1
        }
        answer += 1
    }
    
    recur(0, s.count)
    return answer
}
