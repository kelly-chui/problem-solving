import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    
    struct Queue {
        var queue: [Int] = []
        var ptr = 0
        
        func isEmpty() -> Bool {
            if queue.isEmpty {
                return true
            } else {
                return ptr >= queue.count
            }
        }
        
        mutating func push(_ v: Int) {
            queue.append(v)
        }
        
        mutating func pop() -> Int {
            let popped = queue[ptr]
            ptr += 1
            if ptr > 5000 {
                queue = Array(queue[ptr...])
                ptr = 0
            }
            return popped
        }
    }
    
    func bfs(_ x: Int, _ y: Int) -> Int {
        if x == y {
            return 0
        }
        var queue = Queue()
        var isVisited = [Int](repeating: 0, count: 1_000_001)
        queue.push(x)
        
        while !queue.isEmpty() {
            if isVisited[y] != 0 {
                return isVisited[y]
            }
            let popped = queue.pop()
            
            if popped + n <= y && isVisited[popped + n] == 0 {
                queue.push(popped + n)
                isVisited[popped + n] = isVisited[popped] + 1
            }
            
            if popped * 2 <= y && isVisited[popped * 2] == 0 {
                queue.push(popped * 2)
                isVisited[popped * 2] = isVisited[popped] + 1
            }
            
            if popped * 3 <= y && isVisited[popped * 3] == 0 {
                queue.push(popped * 3)
                isVisited[popped * 3] = isVisited[popped] + 1
            }
            if isVisited[y] != 0 {
                return isVisited[y]
            }
        }
        return -1
    }
    
    var answer = bfs(x, y)
    
    return answer
}
