func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    struct Point: Hashable {
        let x: Int
        let y: Int
    }
    
    var answer = 0
    let newBoard = Array(board.map { $0.map { String($0) } }.reversed())
    var stacks = [[String]](repeating: [], count: n)
    var deleteP: Set<Point> = []
    
    for b in newBoard {
        for i in 0..<n {
            stacks[i].append(b[i])
        }
    }
    
    while true {
        var stop = true
        for i in 0..<n - 1 {
            for j in 0..<m - 1 {
                let standard = stacks[i][j]
                if standard == "0" { continue }
                if stacks[i + 1][j] == standard && stacks[i][j + 1] == standard && stacks[i + 1][j + 1] == standard {
                    deleteP.insert(Point(x: i, y: j))
                    deleteP.insert(Point(x: i + 1, y: j))
                    deleteP.insert(Point(x: i, y: j + 1))
                    deleteP.insert(Point(x: i + 1, y: j + 1))
                    stop = false
                }
            }
        }
        
        print("before")
        for s in stacks {
            print(s)
        }
        
        
        for d in deleteP {
            stacks[d.x][d.y] = "0"
        }
        deleteP.removeAll()
        stacks = stacks.map { $0.filter { $0 != "0" } }.map { $0 + [String](repeating: "0", count: m - $0.count) }
        if stop {
            break
        }
        print("after")
        for i in 0..<m {
            for j in 0..<n {
                
            }
        }
        print()
    }
    
    for i in stacks {
        for j in i {
            if j == "0" {
                answer += 1
            }
        }
    }
    
    return answer
}
