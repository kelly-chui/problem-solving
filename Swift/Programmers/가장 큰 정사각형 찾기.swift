func solution(_ board:[[Int]]) -> Int {
    var sizeBoard = board
    var boolBoard = board.map { $0.map { $0 == 1 } }
    var answer = 0
    let (rowSize, columnSize) = (board.count, board.first!.count)
    for row in 1..<rowSize {
        for column in 1..<columnSize {
            if boolBoard[row][column] && boolBoard[row - 1][column] && boolBoard[row][column - 1] && boolBoard[row - 1][column - 1] {
                sizeBoard[row][column] = min(sizeBoard[row - 1][column], sizeBoard[row][column - 1], sizeBoard[row - 1][column - 1]) + 1
            }
        }
    }
    for row in 0..<rowSize {
        for column in 0..<columnSize {
            if sizeBoard[row][column] > answer {
                answer = sizeBoard[row][column]
            }
        }
    }
    return answer * answer
}