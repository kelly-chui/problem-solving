func dollarToCent(_ dollar: String) -> Int? {
    guard let doubleDollar = Double(dollar) else { return nil }
    return Int(doubleDollar * 100 + 0.5)
}

while let nm = readLine()?.split(separator: " ").map({ String($0) }),
      let n = Int(nm[0]),
      let m = dollarToCent(nm[1]) {
    if n == 0 && m == 0 { break }
    var calories = [0]
    var prices = [0]
    var dp = [Int](repeating: 0, count: m + 1)
    for _ in 0..<n {
        let cp = readLine()!.split(separator: " ").map { String($0) }
        calories.append(Int(cp[0])!)
        prices.append(dollarToCent(cp[1])!)
    }
    for candy in 1...n {
        let price = prices[candy]
        let calory = calories[candy]
        if price > m { continue }
        for money in price...m {
            dp[money] = max(dp[money - price] + calory, dp[money])
        }
    }
    print(dp[m])
}