import Foundation

func solution(_ s:String) -> Int {
    var newS = Array(s).map { String($0) }
    var answer = 0
    
    if s.count % 2 == 1 {
        return 0
    }
    
    for _ in 0..<newS.count {
        var stack: [String] = []
        var isRight = true
        for element in newS {
            if [")", "}", "]"].contains(element) {
                if stack.count == 0 {
                    isRight = false
                    break
                } else {
                    if element == ")" {
                        if stack.last! == "(" {
                            stack.removeLast()
                        } else {
                            isRight = false
                            break
                        }
                    } else if element == "}" {
                        if stack.last! == "{" {
                            stack.removeLast()
                        } else {
                            isRight = false
                            break
                        }
                    } else if element == "]" {
                        if stack.last! == "[" {
                            stack.removeLast()
                        } else {
                            isRight = false
                            break
                        }
                    }
                }
            } else {
                stack.append(element)
            }
            if !isRight {
                continue
            }
        }
        if isRight {
            answer += 1
        }
        let temp = newS.first!
        newS.removeFirst()
        newS.append(temp)
    }
    
    return answer
}

