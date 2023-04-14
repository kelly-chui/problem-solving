import Foundation

struct Heap {
    var heap: [(Int, Int, Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    mutating func insert(_ v: (Int, Int, Int)) {
        heap.append(v)
        var curIdx = heap.count - 1
        
        
        while curIdx > 0 && heap[curIdx].2 < heap[(curIdx - 1) / 2].2 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() -> (Int, Int, Int) {
        let minValue = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0
        
        while curIdx * 2 + 1 < heap.count {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx < heap.count && heap[rChildIdx].2 < heap[mChildIdx].2 {
                mChildIdx = rChildIdx
            }
            
            if heap[mChildIdx].2 < heap[curIdx].2 {
                heap.swapAt(curIdx, mChildIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return minValue
    }
}

func calDistance() {
    
}

func dijkstra(_ start: (Int, Int)) -> Int {
    let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var heap = Heap()
    var distances = [[Int]](repeating: [Int](repeating: 100_000_000, count: n), count: n)
    distances[start.0][start.1] = cave[0][0]
    heap.insert((start.0, start.1, cave[0][0]))
    
    while !heap.isEmpty() {
        let (row, column, cost): (Int, Int, Int) = heap.delete()
        if distances[row][column] < cost {
            continue
        }
        for move in moves {
            let newRow = row + move.0
            let newColumn = column + move.1
            if newRow < 0 || newRow >= n || newColumn < 0 || newColumn >= n {
                continue
            }
            
            if distances[newRow][newColumn] > cost + cave[newRow][newColumn] {
                distances[newRow][newColumn] = cost + cave[newRow][newColumn]
                heap.insert((newRow, newColumn, distances[newRow][newColumn]))
            }
        }
    }
    return distances[n - 1][n - 1]
}

var n = Int()
var cave = [[Int]]()
var idx = 1

while true {
    n = Int(readLine()!)!
    if n == 0 { break }
    
    cave = []
    for _ in 0..<n {
        cave.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    print("Problem \(idx): \(dijkstra((0, 0)))")
    idx += 1
}
