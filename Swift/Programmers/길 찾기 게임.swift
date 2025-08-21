import Foundation

class Node {
    let num: Int
    let x: Int
    let y: Int
    var left: Node?
    var right: Node?
    
    init(num: Int, _ x: Int, _ y: Int) {
        self.num = num
        self.x = x
        self.y = y
    }

    func insert(_ child: Node) {
        if child.x < self.x {
            if let l = left { l.insert(child) }
            else { left = child }
        } else {
            if let r = right { r.insert(child) }
            else { right = child }
        }
    }
}

func dfsPre(_ cur: Node?, _ result: inout [Int]) {
    guard let cur = cur else { return }
    result.append(cur.num)
    dfsPre(cur.left, &result)
    dfsPre(cur.right, &result)
}

func dfsPost(_ cur: Node?, _ result: inout [Int]) {
    guard let cur = cur else { return }
    dfsPost(cur.left, &result)
    dfsPost(cur.right, &result)
    result.append(cur.num)
}

func solution(_ nodeinfo: [[Int]]) -> [[Int]] {
    var nodes: [(num: Int, x: Int, y: Int)] = []
    for (i, p) in nodeinfo.enumerated() {
        nodes.append((i + 1, p[0], p[1]))
    }
    nodes.sort { a, b in
        if a.y == b.y { return a.x < b.x }
        return a.y > b.y
    }
    var root: Node? = nil
    for n in nodes {
        let node = Node(num: n.num, n.x, n.y)
        if let r = root { r.insert(node) }
        else { root = node }
    }
    var pre = [Int]()
    var post = [Int]()
    dfsPre(root, &pre)
    dfsPost(root, &post)
    return [pre, post]
}
