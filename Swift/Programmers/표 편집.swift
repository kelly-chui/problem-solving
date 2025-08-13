import Foundation

class ListNode {
    var num: Int
    var pre: ListNode?
    var post: ListNode?
    
    init(num: Int, pre: ListNode?, post: ListNode?) {
        self.num = num
        self.pre = pre
        self.post = post
    }
}

struct LinkedList {
    var first: ListNode?
    var last: ListNode?
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var linkedList = LinkedList()
    var current: ListNode? = nil
    for i in 0..<n {
        let node = ListNode(num: i, pre: linkedList.last, post: nil)
        if linkedList.first == nil { linkedList.first = node }
        linkedList.last?.post = node
        linkedList.last = node
        if i == k {
            current = node
        }
    }
    var deleteStack = [ListNode]()
    for command in cmd {
        if command == "C" {
            if let currentNode = current {
                deleteStack.append(currentNode)
            }
            let pre = current?.pre
            let post = current?.post
            pre?.post = post
            post?.pre = pre
            if pre == nil { linkedList.first = post }
            if post == nil { linkedList.last = pre  }
            current = post ?? pre
        } else if command == "Z" {
            guard let last = deleteStack.popLast() else { continue }
            let pre = last.pre
            let post = last.post
            pre?.post = last
            post?.pre = last
            if pre == nil { linkedList.first = last }
            if post == nil { linkedList.last = last }
        } else {
            let token = command.split(separator: " ").map { String($0) }
            if token[0] == "U", let x = Int(token[1]) {
                for _ in 0..<x {
                    current = current?.pre
                }
            }
            if token[0] == "D", let x = Int(token[1]) {
                for _ in 0..<x {
                    current = current?.post
                }
            }
        }
    }
    var alive = Array(repeating: "X", count: n)
    var node = linkedList.first
    while let currentNode = node {
        alive[currentNode.num] = "O"
        node = currentNode.post
    }
    return alive.joined()
}
