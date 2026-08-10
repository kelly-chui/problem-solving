import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    func dfs(_ location: (Int, Int), _ n: Int, _ place: [[String]], _ isTrue: inout Bool) {
        if n == 2 {
            return
        }
        for move in moves {
            let newX = location.0 + move.0
            let newY = location.1 + move.1
            if newX < 0 || newX >= 5 || newY < 0 || newY >= 5 {
                continue
            }
            if isVisited[newX][newY] {
                continue
            }
            if place[newX][newY] == "X" {
                continue
            }
            if place[newX][newY] == "P" {
                isTrue = false
                print(location.0, location.1)
                print(newX, newY)
                print(place[location.0][location.1])
                print("n: \(n)")
                break
            }
    
            isVisited[newX][newY] = true
            dfs((newX, newY), n + 1, place, &isTrue)
            isVisited[newX][newY] = false
        }
    }
    
    let moves = [(1, 0), (-1, 0), (0, -1), (0, 1)]
    let arrayPlaces = places.map { $0.map { Array($0).map { String($0) } } }
    var answer: [Int] = []
    var isVisited = [[Bool]]()
    
    for place in arrayPlaces {
        var isTrue = true
        isVisited = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
        for row in 0..<5 where isTrue {
            for column in 0..<5 {
                if isTrue && place[row][column] == "P" {
                    isVisited[row][column] = true
                    dfs((row, column), 0, place, &isTrue)
                    isVisited[row][column] = false
                }
            }
        }
        answer.append(isTrue ? 1 : 0)
    }
    
    return answer
}
