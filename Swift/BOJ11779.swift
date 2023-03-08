//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/06.
//

import Foundation

func findRoute(end: Int) -> [Int] {
    var route: [Int] = [end]
    var next = end
    
    while routes[next] != 0 {
        next = routes[next]
        route.append(next)
    }
    return route.reversed()
}

struct Heap {
    var heap: [(Int, Int)] = []
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    mutating func insert(_ value: (Int, Int)) {
        heap.append(value)
        var curIdx = heap.count - 1
        
        while curIdx > 0 && heap[curIdx].1 < heap[(curIdx - 1) / 2].1 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() -> (Int, Int) {
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0
        
        while curIdx * 2 + 1 <= heap.count - 1 {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx <= heap.count - 1 && heap[rChildIdx].1 < heap[lChildIdx].1 {
                mChildIdx = rChildIdx
            }
            
            if heap[mChildIdx].1 < heap[curIdx].1 {
                heap.swapAt(mChildIdx, curIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return min
    }
}

func dijkstra(_ start: Int) {
    var heap = Heap()
    heap.insert((start, 0))
    distances[start] = 0
    
    while !heap.isEmpty() {
        var (node, cost) = heap.delete()
        if distances[node] < cost {
            continue
        }
        for (newNode, newCost) in graph[node] {
            if distances[newNode] > cost + newCost {
                distances[newNode] = cost + newCost
                routes[newNode] = node
                heap.insert((newNode, distances[newNode]))
            }
        }
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = [[(Int, Int)]](repeating: [], count: n + 1)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[abc[0]].append((abc[1], abc[2]))
}
let se = readLine()!.split(separator: " ").map { Int(String($0))! }
let start = se[0]
let end = se[1]

var distances = [Int](repeating: 100_000_001, count: n + 1)
var routes = [Int](repeating: 0, count: n + 1)

dijkstra(start)
var route = findRoute(end: end)

print(distances[end])
print(route.count)
print(route.map { String($0) }.joined(separator: " "))
