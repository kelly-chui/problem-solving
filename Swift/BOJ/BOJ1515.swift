let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var table = Array(readLine()!)
var answer = 0

for idx1 in 0..<table.count {
    if table[idx1] == "P" {
        for idx2 in max(idx1 - k, 0)...min(idx1 + k, n - 1) {
            if table[idx2] == "H" {
                table[idx2] = " "
                answer += 1
                break
            }
        }
    }
}

print(answer)