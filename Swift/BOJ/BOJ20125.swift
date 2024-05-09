let n = Int(readLine()!)!
var board = [[Character]]()
for _ in 0..<n {
    board.append(Array(readLine()!))
}
var heartLocation = (0, 0)

var isHeartLocated = false
for row in 1..<n - 1 where !isHeartLocated {
    for column in 1..<n - 1 {
        let neighbors = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        isHeartLocated = true
        for neighbor in neighbors {
            if board[row + neighbor.0][column + neighbor.1] != "*" {
                isHeartLocated = false
            }
        }
        if isHeartLocated {
            heartLocation = (row, column)
            break
        }
    }
}

var leftArmLength = 0
var leftArmLocation = (heartLocation.0, heartLocation.1 - 1)
while board[leftArmLocation.0][leftArmLocation.1] == "*" {
    leftArmLength += 1
    leftArmLocation.1 -= 1
    if leftArmLocation.1 < 0 { break }
}

var rightArmLength = 0
var rightArmLocation = (heartLocation.0, heartLocation.1 + 1)
while board[rightArmLocation.0][rightArmLocation.1] == "*" {
    rightArmLength += 1
    rightArmLocation.1 += 1
    if rightArmLocation.1 >= n { break }
}

var headLength = 0
var headLocation = (heartLocation.0 - 1, heartLocation.1)
while board[headLocation.0][headLocation.1] == "*" {
    headLength += 1
    headLocation.0 -= 1
    if headLocation.0 < 0 { break }
}

var waistLength = 0
var waistLocation = (heartLocation.0 + 1, heartLocation.1)
while board[waistLocation.0][waistLocation.1] == "*" {
    waistLength += 1
    waistLocation.0 += 1
}

var leftLegLength = 0
var leftLegLocation = (waistLocation.0, waistLocation.1 - 1)
while board[leftLegLocation.0][leftLegLocation.1] == "*" {
    leftLegLength += 1
    leftLegLocation.0 += 1
    if leftLegLocation.0 >= n { break }
}

var rightLegLength = 0
var rightLegLocation = (waistLocation.0, waistLocation.1 + 1)
while board[rightLegLocation.0][rightLegLocation.1] == "*" {
    rightLegLength += 1
    rightLegLocation.0 += 1
    if rightLegLocation.0 >= n { break }
}

print(heartLocation.0 + 1, heartLocation.1 + 1)
print(leftArmLength, rightArmLength, waistLength, leftLegLength, rightLegLength)
