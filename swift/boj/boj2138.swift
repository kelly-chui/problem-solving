func push(_ cur: Int) {
    for move in [-1, 0, 1] {
        let next = cur + move
        if 0 <= next && next < n {
            if current[next] == "1" {
                current[next] = "0"
            } else {
                current[next] = "1"
            }
        }
    }
    count += 1
}

let n = Int(readLine()!)!
let original = Array(readLine()!)
var destination = Array(readLine()!)
var answer = 987_654_321

// case 0
var current = original
var count = 0
push(0)
for idx in 1..<n {
    if destination[idx - 1] != current[idx - 1] {
        push(idx)
    }
}
if current == destination {
    answer = count
}

// case 1
current = original
count = 0
for idx in 1..<n {
    if destination[idx - 1] != current[idx - 1] {
        push(idx)
    }
}
if current == destination {
    answer = min(answer, count)
}

print(answer == 987_654_321 ? -1 : answer)
