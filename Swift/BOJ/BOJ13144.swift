let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map { Int($0)! }
var (start, end) = (0, 0)
var isContained = Set<Int>()
var answer = 0

while end < n {
    while isContained.contains(seq[end]) {
        isContained.remove(seq[start])
        start += 1
    }
    isContained.insert(seq[end])
    answer += end - start + 1
    end += 1
}

print(answer)