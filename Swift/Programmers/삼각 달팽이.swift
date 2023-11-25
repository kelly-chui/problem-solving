import Foundation

func solution(_ n:Int) -> [Int] {
    if n == 2 {
        return [1, 2, 3]
    } else if n == 3 {
        return [1, 2, 6, 3, 4, 5]
    }
    func sum(_ n: Int) -> Int {
        return (1...n).reduce(0) { $0 + $1 }
    }
    
    var triangle = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    let mode = [(1, 0), (0, 1), (-1, -1)]
    var answer: [Int] = []
    var loc = (0, 0)
    var count = n
    var m = 0
    var idx = 1
    for i in 0..<n {
        for j in 1...count {
            triangle[loc.0][loc.1] = idx
            loc = (loc.0 + mode[m].0, loc.1 + mode[m].1)
            idx += 1
            if j == count - 1 && count == n {
                break
            }
        }
        count -= 1
        if m == 0 {
            m = 1
        } else if m == 1{
            m = 2
        } else {
            m = 0
        }
    }
    
    for i in 0..<n {
        for j in 0..<i {
            if triangle[i][j] == 0 {
                triangle[i][j] = sum(n)
                break
            }
        }
    }
    
    for t in triangle {
        for e in t {
            if e != 0 {
                answer.append(e)
            }
        }
    }

    return answer
}
