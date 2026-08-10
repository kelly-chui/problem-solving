import Foundation

func backTracking(_ digit: Int, _ num: Int, _ count: Int, _ order: Int) {
    if fakeDisplay.count == k {
        if num != 0 && num != x {
            answer += 1
        }
        return
    }

    for i in 0...9 {
        let newDigit = digit / 10
        let newNum = num + (i * digit)
        let newCount = count + preCal[i][currentDisplay[order]]
        let newOrder = order + 1

        if newNum <= n && newCount <= p {
            fakeDisplay.append(i)
            backTracking(newDigit, newNum, newCount, newOrder)
            fakeDisplay.removeLast()
        }
    }
}

let nkpx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k, p, x) = (nkpx[0], nkpx[1], nkpx[2], nkpx[3])
let currentDisplay = String(format: "%0\(k)d", x).map { Int(String($0))! }
/*
let dict = [
    0: [1, 1, 1, 0, 1, 1, 1],
    1: [0, 0, 1, 0, 0, 1, 0],
    2: [1, 0, 1, 1, 1, 0, 1],
    3: [1, 0, 1, 1, 0, 1, 1],
    4: [0, 1, 1, 1, 0, 1, 0],
    5: [1, 1, 0, 1, 0, 1, 1],
    6: [1, 1, 0, 1, 1, 1, 1],
    7: [1, 0, 1, 0, 0, 1, 0],
    8: [1, 1, 1, 1, 1, 1, 1],
    9: [1, 1, 1, 1, 0, 1, 1]
    ]

var preCal = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10)
for start in 0...9 {
    for end in 0...9 {
        var count = 0
        for idx in 0...6 {
            if dict[start]![idx] != dict[end]![idx] {
                count += 1
            }
        }
        preCal[start][end] = count
    }
}
*/

let preCal = [[0, 4, 3, 3, 4, 3, 2, 3, 1, 2], [4, 0, 5, 3, 2, 5, 6, 1, 5, 4], [3, 5, 0, 2, 5, 4, 3, 4, 2, 3], [3, 3, 2, 0, 3, 2, 3, 2, 2, 1], [4, 2, 5, 3, 0, 3, 4, 3, 3, 2], [3, 5, 4, 2, 3, 0, 1, 4, 2, 1], [2, 6, 3, 3, 4, 1, 0, 5, 1, 2], [3, 1, 4, 2, 3, 4, 5, 0, 4, 3], [1, 5, 2, 2, 3, 2, 1, 4, 0, 1], [2, 4, 3, 1, 2, 1, 2, 3, 1, 0]]
var answer = 0
var fakeDisplay = [Int]()
backTracking(Int(pow(10.0, Double(k - 1))), 0, 0, 0)
print(answer)
