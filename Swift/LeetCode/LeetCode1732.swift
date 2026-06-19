// https://leetcode.com/problems/find-the-highest-altitude

class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var altitude = 0
        return gain.reduce(0) { highest, gain in
            altitude += gain
            return max(highest, altitude)
        }
    }
}
