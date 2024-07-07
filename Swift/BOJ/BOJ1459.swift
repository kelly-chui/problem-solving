import Foundation

let xyws = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y, w, s) = (xyws[0], xyws[1], xyws[2], xyws[3])

var answer = (x + y) * w
if (x + y) % 2 == 1 {
    answer = min(answer, (max(x, y) - 1) * s + w)
} else {
    answer = min(answer, max(x, y) * s)
}
answer = min(answer, min(x, y) * s + abs(x - y) * w)

print(answer)
