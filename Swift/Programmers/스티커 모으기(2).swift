import Foundation

func solution(_ sticker:[Int]) -> Int{
    let n = sticker.count
    guard n != 1 else { return sticker[0] }
    guard n != 2 else { return max(sticker[0], sticker[1]) }
    let arraySolution: ([Int], Int) -> Int = { (sticker, n) in
        var answer = 0
        var dp = [Int](repeating: 0, count: n)
        dp[0] = sticker[0]
        dp[1] = max(sticker[0], sticker[1])
        for i in 2..<n {
            dp[i] = max(dp[i - 1], dp[i - 2] + sticker[i])
        }
        return dp[n - 1]
    }
    return max(
        arraySolution(Array(sticker[0..<sticker.count - 1]), n - 1), 
        arraySolution(Array(sticker[1..<sticker.count]), n - 1)
    )
}
