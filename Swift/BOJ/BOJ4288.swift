// https://www.acmicpc.net/problem/4288
// 스택이랑 ccw 섞인 문제 같음

struct Point: Hashable {
    let x: Double
    let y: Double
}
struct Stick: Hashable {
    let start: Point
    let end: Point
}

func ccw(_ a: Point, _ b: Point, _ c: Point) -> Int {
    let op = (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)
    if op > 0 { return 1 }
    if op < 0 { return -1 }
    return 0
}

func isIntersect(_ s1: Stick, _ s2: Stick) -> Bool {
    let (p1, p2, q1, q2) = (s1.start, s1.end, s2.start, s2.end)
    let p = ccw(p1, p2, q1) * ccw(p1, p2, q2)
    let q = ccw(q1, q2, p1) * ccw(q1, q2, p2)
    if p == 0 && q == 0 { // 겹칠수도 있으니까
        return max(p1.x, p2.x) >= min(q1.x, q2.x) && max(q1.x, q2.x) >= min(p1.x, p2.x) &&
               max(p1.y, p2.y) >= min(q1.y, q2.y) && max(q1.y, q2.y) >= min(p1.y, p2.y)
    }
    return p <= 0 && q <= 0
}

while let n = Int(readLine()!), n != 0 {
    var sticks = [Stick]()
    var isTop = Set<Int>()
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map { Double($0)! }
        let stick: Stick = Stick(
            start: Point(x: input[0], y: input[1]),
            end: Point(x: input[2], y: input[3])
        )
        sticks.append(stick)
        for j in isTop where i != j {
            if isIntersect(sticks[i], sticks[j]) {
                isTop.remove(j)
            }
        }
        isTop.insert(i)
    }
    print("Top sticks: ", terminator: "")
    for (idx, element) in isTop.sorted(by: { $0 < $1 }).enumerated() {
        print(element + 1, terminator: idx == isTop.count - 1 ? ".\n" : ", ")
    }
}
