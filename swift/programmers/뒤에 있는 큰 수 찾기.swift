import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack: [(Int, Int)] = []
    var answer = [Int](repeating: 0, count: numbers.count)
    
    for idx in 0..<numbers.count {
        while !stack.isEmpty && stack.last!.1 < numbers[idx] {
            answer[stack.popLast()!.0] = numbers[idx]
        }
        stack.append((idx, numbers[idx]))
    }
    
    while !stack.isEmpty {
        answer[stack.popLast()!.0] = -1
    }
    
    return answer
}
