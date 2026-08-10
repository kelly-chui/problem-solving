import Foundation

func solution(_ board:[String]) -> Int {
    func check(_ s: Set<Int>) -> Bool {
        let wins: Array<Set<Int>> = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
        for win in wins {
            if s == s.union(win) {
                return true
            }
        }
        return false
    }
    var arrayBoard = board.map { Array($0).map { String($0) } }
    var oSet: Set<Int> = []
    var xSet: Set<Int> = []
    
    var index = 1
    for row in 0..<3 {
        for column in 0..<3 {
            if arrayBoard[row][column] == "O" {
                oSet.insert(index)
            } else if arrayBoard[row][column] == "X" {
                xSet.insert(index)
            }
            index += 1
        }
    }

    if oSet.count < xSet.count {
        return 0
    } else if oSet.count == xSet.count {
        if check(oSet) {
            return 0
        }
    } else if oSet.count > xSet.count + 1 {
        return 0
    } else {
        if check(xSet) {
            return 0
        }
    }
    return 1
}
