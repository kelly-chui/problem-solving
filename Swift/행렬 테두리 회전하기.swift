import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var table: [[Int]] = []
    var idx = 1
    for _ in 0..<rows {
        table.append(Array(idx...idx + columns - 1))
        idx = idx + columns
    }
    var answer: [Int] = []
    
    for query in queries {
        var minValue = rows * columns
        var buffer: [(Int, Int, Int)] = []
        let (x1, y1) = (query[0] - 1, query[1] - 1)
        let (x2, y2) = (query[2] - 1, query[3] - 1)
        
        for x in x1 + 1...x2 {
            buffer.append((x - 1, y1, table[x][y1]))
            minValue = min(minValue, table[x][y1])
        }
        for x in x1..<x2 {
            buffer.append((x + 1, y2, table[x][y2]))
            minValue = min(minValue, table[x][y2])
        }
        for y in y1..<y2 {
            buffer.append((x1, y + 1, table[x1][y]))
            minValue = min(minValue, table[x1][y])
        }
        for y in y1 + 1...y2 {
            buffer.append((x2, y - 1, table[x2][y]))
            minValue = min(minValue, table[x2][y])
        }
        answer.append(minValue)
        for b in buffer {
            table[b.0][b.1] = b.2
        }
    }
    
    return answer
}
