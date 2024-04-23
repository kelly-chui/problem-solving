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

    // 유효한지 판단하는 변수
    var isValid = true

    // O가 X보다 많거나, X가 O보다 2개 이상 많은 경우
    if countX < countO || countX >= countO + 2 {
        print("invalid")
        continue
    }
    
    // 이기는 돌 선택 두 개가 같으면 O 다르면 X
    var winner: Character = "X"
    if countX == countO {
        winner = "O"
    }

    // 3*3 보드로 만들기
    var board = [[Character]]()
    board.append(Array(line[0...2]))
    board.append(Array(line[3...5]))
    board.append(Array(line[6...8]))
    
    // 3개로 한 줄을 만들었는지 확인하기
    var isWinner = false // 승패가 갈렸는지

    // 가로
    for row in 0..<4 {
        if board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][0] != "." {
            if board[row][0] == winner { // 승패가 갈렸고, 유효한 승자가 맞는 상황
                isWinner = true
            } else { // 승패가 갈렸는데, 유효한 승자가 아닌 상황
                isValid = false
            }
        }
    }

    // 세로
    for column in 0..<3 {
        if board[0][column] == board[1][column] && board[1][column] == board[2][column] && board[0][column] != "." {
            if board[0][column] == winner { // 승패가 갈렸고, 유효한 승자가 맞는 상황
                isWinner = true
            } else { // 승패가 갈렸는데, 유효한 승자가 아닌 상황
                isValid = false
            }
        }
    }

    // 대각선 "\"
    if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != "." {
        if board[0][0] == winner {
            isWinner = true
        } else {
            isValid = false
        }
    }

    // 대각선 "/"
    if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != "." {
        if board[0][2] != "." {
            isWinner = true
        } else {
            isValid = false
        }
    }

    // 승자가 없는데도 빈칸이 존재한다면
    if countDot > 0 && !isWinner {
        isValid = false
    }

    print(isValid ? "valid" : "invalid")
}