func reconstruct(_ i: Int, _ budget: Int, _ invest: [[Int]], _ first: inout Bool) {
    if i == 0 { return }
    let k = invest[i][budget]
    reconstruct(i - 1, budget - k, invest, &first)
    if !first { print(" ", terminator: "") }
    print(k, terminator: "")
    first = false
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var companies = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 1...m {
        companies[i + 1][j] = input[j]
    }
}
var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
var invest = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

for i in 1...m {
    for j in 0...n {
        var maxProfit = 0
        var investMoney = 0
        for k in 0...j {
            let candidate = dp[i - 1][j - k] + companies[k][i]
            if candidate > maxProfit {
                maxProfit = candidate
                investMoney = k
            }
        }
        dp[i][j] = maxProfit
        invest[i][j] = investMoney
    }
}
var first = true
print(dp[m][n])
reconstruct(m, n, invest, &first)
print()    
