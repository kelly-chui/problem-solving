func dfs(parent: Int) {
    if tree[parent] != nil {
        for child in tree[parent]! {
            dfs(parent: child)
        }
    } else {
        if parent != -1 {
            answer += 1
        }
    }
}

let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int($0) }
let deletedNode = Int(readLine()!)!
var tree = [Int: [Int]]()
var answer = 0

input[deletedNode] = nil

for idx in input.indices {
    guard let parent = input[idx] else {
        continue
    }
    tree[parent, default: []].append(idx)
}

dfs(parent: -1)
print(answer)
