import Foundation

struct Queue {
    var queue = [Int]()
    var ptr = 0
    var isEmpty: Bool { ptr >= queue.count }
    mutating func push(_ v: ) {
        queue.append()
    }
    mutating func pop() {

    }
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])