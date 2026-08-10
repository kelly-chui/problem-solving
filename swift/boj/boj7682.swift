import Foundation

while let input = readLine() {
    if input == "end" {
        exit(0)
    }
    let line = Array(input)
    var countX = 0
    var countO = 0
    var countDot = 0
    for cell in line {
        if cell == "O" {
            countO += 1
        } else if cell == "X" {
            countX += 1
        } else {
            countDot += 1
        }
    }
    if countX < countO || countX >= countO + 2 {
        print("invalid")
        continue
    }
    var winner: Character = "X"
    if countX == countO {
        winner = "O"
    }
    var board = [[Character]]()
    board.append(Array(line[0...2]))
    board.append(Array(line[3...5]))
    board.append(Array(line[6...8]))
    
    var isValid = true
    var isWinner = false
    for row in 0..<3 {
        if board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][0] != "." {
            if board[row][0] == winner {
                isWinner = true
            } else {
                isValid = false
            }
        }
    }
    for column in 0..<3 {
        if board[0][column] == board[1][column] && board[1][column] == board[2][column] && board[0][column] != "." {
            if board[0][column] == winner {
                isWinner = true
            } else {
                isValid = false
            }
        }
    }
    if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != "." {
        if board[0][0] == winner {
            isWinner = true
        } else {
            isValid = false
        }
    }
    if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != "." {
        if board[0][2] != "." {
            isWinner = true
        } else {
            isValid = false
        }
    }

    if countDot > 0 && !isWinner {
        isValid = false
    }
    print(isValid ? "valid" : "invalid")
}
