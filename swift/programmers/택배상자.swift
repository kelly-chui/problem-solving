import Foundation

func solution(_ order:[Int]) -> Int {
    var answer = 0
    var stack: [Int] = []
    var rOrder = Array(order.reversed().map { $0 - 1 })
    for o in 0..<order.count {
        if !stack.isEmpty && stack.last! == rOrder.last! {
            stack.removeLast()
            rOrder.removeLast()
            answer += 1
        }
        
        if o == rOrder.last! {
            answer += 1
            rOrder.removeLast()
        } else {
            stack.append(o)
        }
    }
    
    while !rOrder.isEmpty && !stack.isEmpty {
        if stack.last! == rOrder.last! {
            stack.removeLast()
            rOrder.removeLast()
            answer += 1
        } else {
            break
        }
    }
    return answer
}
