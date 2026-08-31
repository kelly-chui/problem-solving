// https://leetcode.com/problems/find-the-minimum-and-maximum-number-of-nodes-between-critical-points

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {
    func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
        var criticalPoints = [Int]()
        var prev = head
        var current = head?.next
        var currentIdx = 2
        while let cur = current, let next = cur.next, let pre = prev {
            if (pre.val < cur.val && next.val < cur.val) ||
               (pre.val > cur.val && next.val > cur.val) {
                criticalPoints.append(currentIdx)
            }
            prev = current
            current = next
            currentIdx += 1
        }
        guard criticalPoints.count >= 2 else { return [-1, -1] }
        let minDist = zip(criticalPoints, criticalPoints.dropFirst())
            .map { $1 - $0 }
            .min()!
        return [minDist, criticalPoints.last! - criticalPoints.first!]
    }
}
