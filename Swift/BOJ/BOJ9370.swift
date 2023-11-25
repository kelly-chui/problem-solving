//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/03/10.
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
        let min = heap[0]
        heap.swapAt(0, heap.count - 1)
        var curIdx = 0
        heap.removeLast()
        
        while curIdx * 2 + 1 <= heap.count - 1 {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx <= heap.count - 1 && heap[rChildIdx].1 < heap[lChildIdx].1 {
                mChildIdx = rChildIdx
            }
            
            if heap[mChildIdx].1 > heap[curIdx].1 {
                heap.swapAt(mChildIdx, curIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        return min
    }
}

func dijkstra(start: Int, n: Int, roads: [[(Int, Int)]]) -> [Int] {
    var heap = Heap()
    var distances = [Int](repeating: 100_000_000, count: n + 1)
    heap.insert((start, 0))
    distances[start] = 0
    
    while !heap.isEmpty() {
        let (node, dist) = heap.delete()
        if distances[node] < dist {
            continue
        }
        for (newNode, newDist) in roads[node] {
            if distances[newNode] > dist + newDist {
                distances[newNode] = dist + newDist
                heap.insert((newNode, dist + newDist))
            }
        }
    }
    return distances
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let nmt = readLine()!.split(separator: " ").map { Int(String($0))! }
    let sgh = readLine()!.split(separator: " ").map { Int(String($0))! }
    var roads = [[(Int, Int)]](repeating: [], count: nmt[0] + 1)
    var predicts: [Int] = []
    for _ in 0..<nmt[1] {
        let abd = readLine()!.split(separator: " ").map { Int(String($0))! }
        roads[abd[0]].append((abd[1], abd[2]))
        roads[abd[1]].append((abd[0], abd[2]))
    }
    for _ in 0..<nmt[2] {
        let predict = Int(readLine()!)!
        predicts.append(predict)
    }
    let dijkstraS = dijkstra(start: sgh[0], n: nmt[0], roads: roads)
    let start2g = dijkstraS[sgh[1]]
    let start2h = dijkstraS[sgh[2]]
    let dijkstraG = dijkstra(start: sgh[1], n: nmt[0], roads: roads)
    let dijkstraH = dijkstra(start: sgh[2], n: nmt[0], roads: roads)
    let g2h = dijkstraG[sgh[2]]
    for i in predicts.sorted(by: { $0 < $1 }) {
        let s2predict = dijkstraS[i]
        let g2predict = dijkstraG[i]
        let h2predict = dijkstraH[i]
        if s2predict == g2h + start2g + h2predict || s2predict == g2h + start2h + g2predict {
            print(i, terminator: " ")
        }
    }
    print()
}
