func swap(_ stat: Int) -> Int {
    if stat == 0 {
        return 1
    } else {
        return 0
    }
}

func boy(_ switchNum: Int) {
    var currentNum = switchNum
    while currentNum <= n {
        switches[currentNum - 1] = swap(switches[currentNum - 1])
        currentNum += switchNum
    }
}

func girl(_ switchNum: Int) {
    var start = switchNum - 1
    var end = switchNum - 1
    if start == 0 || end == n - 1 {
        switches[start] = swap(switches[start])
        return
    }
    while switches[start] == switches[end] {
        start -= 1
        end += 1
        if start < 0 || end >= n {
            break
        }
    }
    for idx in start + 1...end - 1 {
        switches[idx] = swap(switches[idx])
    }
}

let n = Int(readLine()!)!
var switches = readLine()!.split(separator: " ").map { Int($0)! }
let studentCount = Int(readLine()!)!
for _ in 0..<studentCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (sex, switchNum) = (input[0], input[1])
    if sex == 1 {
        boy(switchNum)
    } else {
        girl(switchNum)
    }
}

for idx in 0..<n {
    print(switches[idx], terminator: (idx + 1) % 20 == 0 ? "\n" : " ")
}