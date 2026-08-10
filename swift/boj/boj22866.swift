let n = Int(readLine()!)!
let buildings = readLine()!.split(separator: " ").map { Int($0)! }
var answer = [(Int, Int, Int)](repeating: (0, 0, 0), count: n)

// Forward
var forwardStack = [Int]()
for idx in 0..<n {
    if forwardStack.isEmpty {
        forwardStack.append(idx)
    } else {
        while let topValue = forwardStack.last {
            if buildings[topValue] <= buildings[idx] {
                forwardStack.popLast()
            } else {
                break
            }
        }
        answer[idx].0 += forwardStack.count
        if let last = forwardStack.last {
            answer[idx].1 = last + 1
        }
        forwardStack.append(idx)
    }
}

var backwardStack = [Int]()
for idx in stride(from: n - 1, through: 0, by: -1) {
    if backwardStack.isEmpty {
        backwardStack.append(idx)
    } else {
        while let topValue = backwardStack.last {
            if buildings[topValue] <= buildings[idx] {
                backwardStack.popLast()
            } else {
                break
            }
        }
        answer[idx].0 += backwardStack.count
        if let last = backwardStack.last {
            answer[idx].2 = last + 1
        }
        backwardStack.append(idx)
    }
}

for idx in 0..<answer.count {
    if answer[idx].0 == 0 {
        print(0)
        continue
    }
    var nearest = Int()
    if answer[idx].1 == 0 {
        nearest = answer[idx].2
    } else if answer[idx].2 == 0 {
        nearest = answer[idx].1
    } else {
        let rightGap = idx - (answer[idx].1 - 1)
        let leftGap = (answer[idx].2 - 1) - idx
        if rightGap <= leftGap {
            nearest = answer[idx].1
        } else {
            nearest = answer[idx].2
        }
    }
    print(answer[idx].0, nearest)
}
