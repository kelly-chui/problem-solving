let ng = readLine()!.split(separator: " ").map { String($0) }
let (n, g) = (Int(ng[0])!, ng[1])
let dict = ["Y": 1, "F": 2, "O": 3]
var stack: Set<String> = []
for _ in 0..<n {
    stack.insert(readLine()!)
}
print(stack.count / dict[g]!)