//
//  main.swift
//  algorithm
//
//  Created by KellyChui on 2023/05/15.
//

import Foundation

struct Heap {
    private var heap: [(Int, Int)] = []
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    mutating func insert(_ v: (Int, Int)) {
        heap.append(v)
        var curIdx = heap.count - 1
        
        while curIdx > 0 && heap[curIdx].1 < heap[(curIdx - 1) / 2].1 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() -> (Int, Int) {
        let popped = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0
        
        while curIdx * 2 + 1 < heap.count {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx < heap.count && heap[rChildIdx].1 < heap[mChildIdx].1 {
                mChildIdx = rChildIdx
            }
            
            if heap[curIdx].1 > heap[mChildIdx].1 {
                heap.swapAt(curIdx, mChildIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return popped
    }
}

func dijkstra(_ start: Int) -> Int {
    var heap = Heap()
    var distance = [Int](repeating: 999_999_999_999, count: n)
    heap.insert((start, 0))
    distance[start] = 0
    
    while !heap.isEmpty {
        let (node, time) = heap.delete()
        if distance[node] < time { continue }
        if let routes = graph[node] {
            for (newNode, newTime) in routes {
                if distance[newNode] > time + newTime {
                    distance[newNode] = time + newTime
                    heap.insert((newNode, distance[newNode]))
                }
            }
        }
    }
    return distance[n - 1]
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
a[n - 1] = 0
var graph: [Int: [(Int, Int)]] = [:]
for _ in 0..<m {
    let abt = readLine()!.split(separator: " ").map { Int(String($0))! }
    if a[abt[0]] == 0 && a[abt[1]] == 0 {
        graph[abt[0], default: []].append((abt[1], abt[2]))
        graph[abt[1], default: []].append((abt[0], abt[2]))
    }
}
var answer = dijkstra(0)
print(answer == 999_999_999_999 ? -1 : answer)
