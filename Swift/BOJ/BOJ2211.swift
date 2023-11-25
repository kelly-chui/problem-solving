//
//  main.swift
//  BOJalgorithm
//
//  Created by Kelly Chui on 2023/03/06.
//

import Foundation

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
        var curIdx = 0
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        
        while curIdx * 2 + 1 <= heap.count - 1 {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx <= heap.count - 1 && heap[rChildIdx].1 < heap[mChildIdx].1 {
                mChildIdx = rChildIdx
            }
            
            if heap[curIdx].1 > heap[mChildIdx].1 {
                heap.swapAt(curIdx, mChildIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return min
    }
}

func dijkstra(_ start: Int) -> [Int] {
    var heap = Heap()
    var distances = [Int](repeating: 100_000_000, count: nm[0] + 1)
    heap.insert((start, 0))
    distances[start] = 0
    
    while !heap.isEmpty() {
        let (node, cost) = heap.delete()
        if distances[node] < cost {
            continue
        }
        for (newNode, newCost) in networks[node] {
            if distances[newNode] > cost + newCost {
                distances[newNode] = cost + newCost
                routes[newNode] = node
                heap.insert((newNode, cost + newCost))
            }
        }
    }
    return distances
}

func findPath(_ start: Int) {
    var node = start
    while routes[node] != 0 {
        let edge = (max(node, routes[node]), min(node, routes[node]))
        if !isVisited[node] {
            edges.append(edge)
            isVisited[node] = true
        }
        node = routes[node]
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var networks = [[(Int, Int)]](repeating: [], count: nm[0] + 1)
for _ in 0..<nm[1] {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    networks[abc[0]].append((abc[1], abc[2]))
    networks[abc[1]].append((abc[0], abc[2]))
}
var routes = [Int](repeating: 0, count: nm[0] + 1)
var isVisited = [Bool](repeating: false, count: nm[0] + 1)
let distances = dijkstra(1)
var edges: [(Int, Int)] = []
for i in 2...nm[0] {
    findPath(i)
}
print(edges.count)
for edge in edges {
    print(edge.0, edge.1)
}
