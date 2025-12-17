typealias Candidate = (r: Int, c: Int)

let nmh = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, h) = (nmh[0], nmh[1], nmh[2])

var ladder = Array(repeating: Array(repeating: false, count: n + 1), count: h + 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    ladder[a][b] = true
}

var candidates = [Candidate]()
for r in 1...h {
    for c in 1..<(n) {
        candidates.append((r, c))
    }
}

func canPlace(_ r: Int, _ c: Int) -> Bool {
    if ladder[r][c] { return false }
    if c > 1 && ladder[r][c - 1] { return false }
    if c < n - 1 && ladder[r][c + 1] { return false }
    return true
}

func simulateLine(start: Int) -> Int {
    var current = start
    for row in 1...h {
        if ladder[row][current] {
            current += 1
        } else if current > 1 && ladder[row][current - 1] {
            current -= 1
        }
    }
    return current
}

func simulateLadder() -> Bool {
    for start in 1...n {
        if simulateLine(start: start) != start { return false }
    }
    return true
}

func backtracking(target: Int, added: Int, startIdx: Int) -> Bool {
    if added == target {
        return simulateLadder()
    }
    for i in startIdx..<candidates.count {
        let (r, c) = candidates[i]
        if !canPlace(r, c) { continue }
        ladder[r][c] = true
        if backtracking(target: target, added: added + 1, startIdx: i + 1) { return true }
        ladder[r][c] = false
    }
    return false
}

var answer = -1
for target in 0...3 {
    if backtracking(target: target, added: 0, startIdx: 0) {
        answer = target
        break
    }
}

print(answer)
