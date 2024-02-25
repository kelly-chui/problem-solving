import Foundation

func dfs(_ row: Int, _ column: Int, _ state: Int) {
    if row == n - 1 && column == n - 1 {
        count += 1
        return
    }
    
    if state == 0 {
        if column == n - 1 {
            return
        }

        if 0 <= row && row < n && 0 <= column + 1 && column + 1 < n && room[row][column + 1] == 0 {
            dfs(row, column + 1, 0)
        }

        if 0 <= row + 1 && row + 1 < n && 0 <= column + 1 && column + 1 < n && room[row][column + 1] == 0 && room[row + 1][column] == 0 && room[row + 1][column + 1] == 0 {
            dfs(row + 1, column + 1, 2)
        }
    } else if state == 1 {
        if row == n - 1 {
            return
        }

        if 0 <= row + 1 && row + 1 < n && 0 <= column && column < n && room[row + 1][column] == 0 {
            dfs(row + 1, column, 1)
        }

        if 0 <= row + 1 && row + 1 < n && 0 <= column + 1 && column + 1 < n && room[row][column + 1] == 0 && room[row + 1][column] == 0 && room[row + 1][column + 1] == 0 {
            dfs(row + 1, column + 1, 2)
        }
    } else if state == 2 {
        if 0 <= row && row < n && 0 <= column + 1 && column + 1 < n && room[row][column + 1] == 0 {
            dfs(row, column + 1, 0)
        }

        if 0 <= row + 1 && row + 1 < n && 0 <= column && column < n && room[row + 1][column] == 0 {
            dfs(row + 1, column, 1)
        }

        if 0 <= row + 1 && row + 1 < n && 0 <= column + 1 && column + 1 < n && room[row][column + 1] == 0 && room[row + 1][column] == 0 && room[row + 1][column + 1] == 0 {
            dfs(row + 1, column + 1, 2)
        }
    }
}

var count = 0
var n = Int(readLine()!)!
var room = [[Int]]()

for _ in 0..<n {
    room.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

dfs(0, 1, 0)
print(count)