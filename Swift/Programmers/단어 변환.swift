import Foundation

func compare(_ a: String, _ b: String) -> Bool {
    var count = 0
    for (charA, charB) in zip(a, b) {
        guard charA != charB else { continue }
        count += 1
        if count > 1 { return false }
    }
    return true
}

func bfs(_ begin: String, _ target: String, _ n: Int, _ graph: [String: [String]]) -> Int {
    var queue = [String]()
    queue.append(begin)
    var distanceCount = [String: Int]()
    distanceCount[begin] = 0
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for next in graph[cur, default: []] {
            guard distanceCount[next] == nil else { continue }
            guard let currentCount = distanceCount[cur] else { return 0 }
            if next == target { 
                print(next, target)
                return currentCount + 1 
            }
            queue.append(next)
            distanceCount[next] = currentCount + 1
        }
    }
    return 0
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var graph = [String: [String]]()
    var wordSet = Set<String>(words + [begin])
    wordSet.forEach { cur in
        wordSet.forEach { next in
            guard cur != next else { return }
            if compare(cur, next) {
                graph[cur, default: []].append(next)
            }
        }
    }
    return bfs(begin, target, words.count, graph)
}
