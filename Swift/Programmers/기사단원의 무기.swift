import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var answer = 1
    
    if number == 1 {
        return answer
    }

    for n in 2...number {
        var count = 0
        var factor = 1
        while factor * factor <= n {
            if n % factor == 0 {
                count += 2
                if factor * factor == n {
                    count -= 1
                }
                if count > limit {
                    break
                }
            }
            
            factor += 1
        }
        answer += count > limit ? power : count
    }
    
    return answer
}
