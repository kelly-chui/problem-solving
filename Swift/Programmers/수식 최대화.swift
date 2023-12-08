import Foundation

func solution(_ expression:String) -> Int64 {

    func dfs(order: [String]) {
        if order.count == 3 {
            orders.append(order)
            return
        }
        for op in ["*", "+", "-"] {
            if !order.contains(op) {
                dfs(order: order + [op])
            }
        }
    }

    let operands = expression.components(separatedBy: CharacterSet(charactersIn: "+-*"))
    let operators = expression.filter { Set("+-*").contains($0) }.map { String($0) }
    var orders = [[String]]()
    dfs(order: [String]())
    var answer = 0

    for order in orders {
        var curOperands = operands
        var curOperators = operators
        for op in order {
            var idx = 0
            while idx < curOperators.count {
                if curOperators[idx] == op {
                    if curOperators[idx] == "*" {
                        curOperands[idx] = String(Int(curOperands[idx])! * Int(curOperands[idx + 1])!)
                    } else if curOperators[idx] == "+" {
                        curOperands[idx] = String(Int(curOperands[idx])! + Int(curOperands[idx + 1])!)
                    } else {
                        curOperands[idx] = String(Int(curOperands[idx])! - Int(curOperands[idx + 1])!)
                    }
                    curOperands.remove(at: idx + 1)
                    curOperators.remove(at: idx)
                } else {
                    idx += 1
                }
            }
        }
        if answer < abs(Int(curOperands[0])!) {
            answer = abs(Int(curOperands[0])!)
        }
    }

    return Int64(answer)
}
