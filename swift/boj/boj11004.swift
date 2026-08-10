let k = readLine()!.split(separator: " ").map { Int($0)! }[1]
print(readLine()!.split(separator: " ").compactMap { Int($0) }.sorted { $0 < $1 }[k - 1])
