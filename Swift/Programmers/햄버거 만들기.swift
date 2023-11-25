import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var answer = 0
    var stack: [Int] = []
    
    for i in ingredient {
        stack.append(i)
        while stack.count >= 4 {
            if stack[stack.count - 4...stack.count - 1] == [1, 2, 3, 1] {
                for i in 0..<4 {
                    stack.removeLast()
                }
                answer += 1
            } else {
                break
            }
        }
    }
    return answer
}
