// https://leetcode.com/problems/maximize-active-section-with-trade-i

class Solution {
    func maxActiveSectionsAfterTrade(_ s: String) -> Int {
        var blocks: [(char: Character, count: Int)] = []
        var delta = 0
        let t = "1" + s + "1"
        for c in t {
            if let last = blocks.last, last.char == c {
                blocks[blocks.count - 1].count += 1
            } else {
                blocks.append((char: c, count: 1))
            }
        }
        for i in stride(from: 2, to: blocks.count - 1, by: 2) {
            if i == 0 || i == blocks.count - 1 {
                continue
            }
            delta = max(delta, blocks[i - 1].count + blocks[i + 1].count)
        }
        return s.filter { $0 == "1" }.count + delta
    }
}
