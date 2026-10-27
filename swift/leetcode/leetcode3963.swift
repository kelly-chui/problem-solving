// https://leetcode.com/problems/create-grid-with-exactly-one-path

class Solution {
    func createGrid(_ m: Int, _ n: Int) -> [String] {
        var grid = [String](repeating: "." + String(repeating: "#", count: n - 1), count: m - 1)
        grid.append(String(repeating: ".", count: n))
        return grid
    }
}
