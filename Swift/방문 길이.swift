import Foundation

func asolution(_ dirs:String) -> Int {
    var curLoc = (0, 0)
    var isVisited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 4), count: 11), count: 11)
    let moves: [String: (Int, Int)] = ["U": (0, 1), "D": (0, -1), "R": (1, 0), "L": (-1, 0)]
    let moveIndex: [String: Int] = ["U": 0, "D": 1, "R": 2, "L": 3]
    var answer = 0
    
    for dir in dirs {
        var strDir = String(dir)
        if (-5...5).contains(curLoc.0 + moves[strDir]!.0) && (-5...5).contains(curLoc.1 + moves[strDir]!.1) {
            if !isVisited[curLoc.0 + 5][curLoc.1 + 5][moveIndex[strDir]!] {
                isVisited[curLoc.0 + 5][curLoc.1 + 5][moveIndex[strDir]!] = true
                var tDir = strDir == "U" ? "D" : strDir == "D" ? "U" : strDir == "R" ? "L" : "R"
                isVisited[curLoc.0 + 5 + moves[strDir]!.0][curLoc.1 + 5 + moves[strDir]!.1][moveIndex[tDir]!] = true
                answer += 1
            }
            curLoc = (curLoc.0 + moves[strDir]!.0, curLoc.1 + moves[strDir]!.1)
        }
    }
    return answer
}
