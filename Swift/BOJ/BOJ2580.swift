import Foundation

func dfs(n: Int) {
    if n == blanks.count {
        board.forEach {
            $0.forEach {
                print($0, terminator: " ")
            }
            print()
        }
        exit(0)
    }
    let (row, column) = blanks[n]
    let boxNumber = row / 3 * 3 + column / 3
    for number in 1...9 {
        if isContainedRow[row][number] || 
        isContainedColumn[column][number] || 
        isContainedBox[boxNumber][number] {
            continue
        }
        board[row][column] = number
        isContainedRow[row][number] = true
        isContainedColumn[column][number] = true
        isContainedBox[boxNumber][number] = true
        dfs(n: n + 1)
        board[row][column] = 0
        isContainedRow[row][number] = false
        isContainedColumn[column][number] = false
        isContainedBox[boxNumber][number] = false
    }
}

var board = [[Int]]()
for _ in 0..<9 {
    board.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}
var blanks = [(Int, Int)]()
var isContainedRow = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9)
var isContainedColumn = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9)
var isContainedBox = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 9)
for row in 0..<9 {
    for column in 0..<9 {
        let value = board[row][column]
        let boxNumber = row / 3 * 3 + column / 3
        if value == 0 {
            blanks.append((row, column))
        } else {
            isContainedRow[row][value] = true
            isContainedColumn[column][value] = true
            isContainedBox[boxNumber][value] = true
        }
    }
}

dfs(n: 0)
