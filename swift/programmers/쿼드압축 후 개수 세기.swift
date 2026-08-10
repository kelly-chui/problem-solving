import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    let size = arr.count
    var answer = [0, 0]
    
    func recur(location: (Int, Int), length: Int)  {
        let standard = arr[location.0][location.1]
        var isSame = true
        for row in location.0..<location.0 + length where isSame {
            for column in location.1..<location.1 + length where isSame {
                if arr[row][column] != standard {
                    isSame = false
                }
            }
        }
        if isSame {
            if standard == 0 {
                answer[0] += 1
            } else {
                answer[1] += 1
            }
        } else {
            recur(location: location, length: length / 2)
            recur(location: (location.0 + length / 2, location.1), length: length / 2)
            recur(location: (location.0, location.1 + length / 2), length: length / 2)
            recur(location: (location.0 + length / 2, location.1 + length / 2), length: length / 2)
        }
    }
    
    recur(location: (0, 0), length: size)
    
    return answer
}
