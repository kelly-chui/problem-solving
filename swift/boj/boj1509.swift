let str = Array(readLine()!)
var isPalindrome = [[Bool]](repeating: [Bool](repeating: false, count: str.count), count: str.count)
var minCut = Array(1...str.count)

for idx in 0..<str.count {
    isPalindrome[idx][idx] = true
}

for subStrLen in 2..<(str.count + 1) {
    for start in 0..<(str.count - subStrLen + 1) {
        let end = start + subStrLen - 1
        if str[start] == str[end] {
            if subStrLen == 2 {
                isPalindrome[start][end] = true
            } else {
                isPalindrome[start][end] = isPalindrome[start + 1][end - 1]
            }
        }
    }
}

for i in 0..<str.count {
    if isPalindrome[0][i] {
        minCut[i] = 1
        continue
    }
    for j in 0..<i {
        if isPalindrome[j + 1][i] {
            minCut[i] = min(minCut[i], minCut[j] + 1)
        }
    }
}

print(minCut[str.count - 1])
