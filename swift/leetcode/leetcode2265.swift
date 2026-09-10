// https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    typealias TraversalNode = (sum: Int, count: Int, answer: Int)
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        func traversalTree(_ current: TreeNode?) -> TraversalNode {
            guard let current else { return (0, 0, 0) }
            let left = traversalTree(current.left)
            let right = traversalTree(current.right)
            let totalCount = left.count + right.count + 1
            let totalSum = left.sum + right.sum + current.val
            let isMatch = (totalSum / totalCount) == current.val
            let answer = left.answer + right.answer + (isMatch ? 1 : 0)
            return (totalSum, totalCount, answer)
        }
        return traversalTree(root).answer
    }
}
