let nwl = readLine()!.split(separator: " ").map { Int($0)! }
let a = readLine()!.split(separator: " ").map { Int($0)! }
let (n, w, l) = (nwl[0], nwl[1], nwl[2])

var queue = [(Int, Int)]()

var answer = 0
var weightSum = 0
var truck = 0
while truck < a.count {
    if let head = queue.first {
        if head.1 == answer - w {
            weightSum -= queue.removeFirst().0
        }
    }
    if queue.count < w && weightSum + a[truck] <= l {
        queue.append((a[truck], answer))
        weightSum += a[truck]
        truck += 1
    }
    answer += 1
}

print(answer + w)