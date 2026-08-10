let rct = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r, c, t) = (rct[0], rct[1], rct[2])
let moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var (up, down) = (0, 0)
var house = [[Int]]()
var answer = 0
for _ in 0..<r {
    house.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

loop1: for row in 0..<r {
    loop2: for column in 0..<c {
        if house[row][column] == -1 {
            up = row
            down = row + 1
            break loop1
        }
    }
}

for _ in 0..<t {
    // diffusion
    var diffusionQueue = [(Int, Int, Int)]()
    for row in 0..<r {
        for column in 0..<c {
            if house[row][column] != 0 && house[row][column] != -1 {
                for move in moves {
                    let (newRow, newColumn) = (row + move.0, column + move.1)
                    if newRow < 0 || newRow >= r || newColumn < 0 || newColumn >= c {
                        continue
                    }
                    if house[newRow][newColumn] == -1 {
                        continue
                    }
                    diffusionQueue.append((newRow, newColumn, house[row][column] / 5))
                    diffusionQueue.append((row, column, -house[row][column] / 5))
                }
            }
        }
    }
    for element in diffusionQueue {
        let (row, column, value) = element
        house[row][column] += value
    }

    for i in stride(from: up - 1, to: 0, by: -1) {
        house[i][0] = house[i - 1][0]
    }
    for i in 0..<(c - 1) {
        house[0][i] = house[0][i + 1]
    }
    for i in 1...up {
        house[i - 1][c - 1] = house[i][c - 1]
    }
    for i in stride(from: c - 1, to: 1, by: -1) {
        house[up][i] = house[up][i - 1]
    }
    house[up][1] = 0

    for i in (down + 1)..<r - 1 {
        house[i][0] = house[i + 1][0]
    }
    for i in 0..<(c - 1) {
        house[r - 1][i] = house[r - 1][i + 1]
    }
    for i in stride(from: r - 1, to: down, by: -1) {
        house[i][c - 1] = house[i - 1][c - 1]
    }
    for i in stride(from: c - 1, to: 1, by: -1) {
        house[down][i] = house[down][i - 1]
    }
    house[down][1] = 0
}

for row in 0..<r {
    for column in 0..<c {
        if house[row][column] > 0 {
            answer += house[row][column]
        }
    }
}

print(answer)
