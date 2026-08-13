// https://leetcode.com/problems/longest-substring-of-one-repeating-character

class Solution {
    typealias Node = (
        leftChar: Character, leftCount: Int,
        rightChar: Character, rightCount: Int,
        maxCount: Int,
        total: Int
    )

    struct SegmentTree {
        private var container: [Node]
        private var n: Int
        var top: Node { container[0] }

        init(nodes: [Character]) {
            self.n = nodes.count
            let empty: Node = (" ", 0, " ", 0, 0, 0)
            self.container = [Node](repeating: empty, count: 4 * nodes.count)
            var mutableNodes = nodes
            build(0, 0, n - 1, mutableNodes)
        }

        mutating func build(
            _ cur: Int,
            _ start: Int,
            _ end: Int,
            _ nodes: [Character]
        ) {
            if start == end {
                container[cur] = (nodes[start], 1, nodes[start], 1, 1, 1)
            } else {
                let leftChild = 2 * cur + 1
                let rightChild = leftChild + 1
                let mid = (start + end) / 2
                build(leftChild, start, mid, nodes)
                build(rightChild, mid + 1, end, nodes)
                container[cur] = merge(container[leftChild], container[rightChild])
            }
        }

        mutating func update(
            _ cur: Int,
            _ start: Int,
            _ end: Int,
            _ idx: Int,
            _ val: Character
        ) {
            if start == end {
                container[cur] = (val, 1, val, 1, 1, 1)
            } else {
                let mid = (start + end) / 2
                if idx <= mid {
                    update(2 * cur + 1, start, mid, idx, val)
                } else {
                    update(2 * cur + 2, mid + 1, end, idx, val)
                }
                container[cur] = merge(container[2 * cur + 1], container[2 * cur + 2])
            }
        }

        private func merge(_ left: Node, _ right: Node) -> Node {
            let total = left.total + right.total

            let boundaryCount = left.rightChar == right.leftChar
                ? left.rightCount + right.leftCount
                : 0

            let maxCount = max(left.maxCount, right.maxCount, boundaryCount)

            let leftCount = left.leftChar == right.leftChar && left.leftCount == left.total
                ? left.leftCount + right.leftCount
                : left.leftCount

            let rightCount = right.rightChar == left.rightChar && right.rightCount == right.total
                ? right.rightCount + left.rightCount
                : right.rightCount

            return (
                leftChar: left.leftChar, leftCount: leftCount,
                rightChar: right.rightChar, rightCount: rightCount,
                maxCount: maxCount,
                total: total
            )
        }
    }

    func longestRepeating(_ s: String, _ queryCharacters: String, _ queryIndices: [Int]) -> [Int] {
        var segmentTree = SegmentTree(nodes: Array(s))
        var answer = [Int]()
        var sCount = s.count
        for (char, idx) in zip(queryCharacters, queryIndices) {
            segmentTree.update(0, 0, sCount - 1, idx, char)
            answer.append(segmentTree.top.maxCount)
        }
        return answer
    }
}
