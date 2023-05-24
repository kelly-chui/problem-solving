import Foundation

var trees: [String: Int] = [:]
var total = 0
while let tree = readLine() {
    trees[tree, default: 0] += 1
    total += 1
}
let sortedTrees = trees.sorted {
    $0.key < $1.key
}
for (key, value) in sortedTrees {
    print(key, String(format: "%.4f", (Double(value * 100) / Double(total))))
}
