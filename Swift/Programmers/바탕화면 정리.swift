import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let wp = wallpaper.map { Array($0).map { String($0) } }
    var (lux, luy, rdx, rdy) = (wp.count, wp[0].count, 0, 0)
    var rows: [Int] = []
    var columns: [Int] = []
    for row in 0..<wp.count {
        for column in 0..<wp[row].count {
            if wp[row][column] == "#" {
                rows.append(row)
                columns.append(column)
            }
        }
    }
    return [rows.min()!, columns.min()!, rows.max()! + 1, columns.max()! + 1]
}