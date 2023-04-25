import Foundation

func solution(_ p:String) -> String {
    
    func check(_ u: [String]) -> Bool {
        var stack: [String] = []
        for c in u {
            if c == "(" {
                stack.append(c)
            } else {
                if !stack.isEmpty && stack.last! == "(" {
                    stack.removeLast()
                }
            }
        }
        return stack.isEmpty
    }
    
    let p = Array(p).map { String($0) }
    
    if check(p) {
        return p.joined()
    }
    
    var (l, r) = (0, 0)
    var answer = ""
    var ptr = 0
    
    for c in p {
        if c == "(" {
            l += 1
        } else {
            r += 1
        }
        ptr += 1
        if l == r {
            break
        }
    }
    
    var u = Array(p[0..<ptr])
    var v = Array(p[ptr...])
    
    if !check(u) {
        u.removeLast()
        u.removeFirst()
        u = u.map { $0 == ")" ? "(" : ")" }
        return "(" + solution(v.joined()) + ")" + u.joined()
    }
    
    return u.joined() + solution(v.joined())
}
