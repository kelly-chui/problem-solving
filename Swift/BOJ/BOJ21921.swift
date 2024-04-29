let nx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, x) = (nx[0], nx[1])
let visitors = readLine()!.split(separator: " ").map { Int($0)! }
var prefixVisitors = visitors
for day in 1..<n {
    prefixVisitors[day] += prefixVisitors[day - 1]
}

var maxVisitors = prefixVisitors[x - 1]
var count = 1
var (start, end) = (0, x)

while end < n {
    let numOfVisitors = prefixVisitors[end] - prefixVisitors[start]
    if maxVisitors < numOfVisitors {
        maxVisitors = numOfVisitors
        count = 1
    } else if maxVisitors == numOfVisitors {
        count += 1
    }
    start += 1
    end += 1
}

if maxVisitors == 0 {
    print("SAD")
} else {
    print(maxVisitors)
    print(count)
}