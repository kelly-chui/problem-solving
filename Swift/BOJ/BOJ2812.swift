import Foundation

struct Deque {
    private var deque: [Int] = []
    private var ptr = 0
    
    mutating func push(_ v: Int) {
        deque.append(v)
    }
    mutating func popFirst() -> Int {
        let popped = deque[ptr]
        ptr += 1
        if ptr > 50_000 {
            deque = Array(deque[ptr...])
            ptr = 0
        }
        return popped
    }
    mutating func popLast() -> Int {
        return deque.removeLast()
    }
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let num = readLine()!.map { String($0) }
var (n, k) = (nk[0], nk[1])

var stack: [String] = []
for element in num {
    while k > 0 && !stack.isEmpty {
        if stack.last! < element {
            stack.removeLast()
            k -= 1
        } else {
            break
        }
    }
    stack.append(element)
}
stack = Array(stack[0...n - nk[1] - 1])
print(stack.joined())
