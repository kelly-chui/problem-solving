// https://leetcode.com/problems/kth-smallest-amount-with-single-denomination-combination

class Solution {
    func findKthSmallest(_ coins: [Int], _ k: Int) -> Int {
        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }
        func lcm(_ a: Int, _ b: Int) -> Int {
            return a / gcd(a, b) * b
        }
        func countValidAmounts(_ x: Int) -> Int {
            var result = 0
            func dfs(_ index: Int, _ currentLCM: Int, _ size: Int) {
                if index == coins.count { return }
                for i in index..<coins.count {
                    let newLCM = lcm(currentLCM, coins[i])
                    if size % 2 == 0 {
                        result += x / newLCM
                    } else {
                        result -= x / newLCM
                    }
                    dfs(i + 1, newLCM, size + 1)
                }
            }
            dfs(0, 1, 0)
            return result
        }
        var left = 1
        var right = k * coins.min()!
        while left < right {
            let mid = (left + right) / 2
            if countValidAmounts(mid) < k {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
