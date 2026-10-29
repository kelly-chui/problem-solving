// https://leetcode.com/problems/palindromic-path-queries-in-a-tree

class Solution {
    func palindromePath(_ n: Int, _ edges: [[Int]], _ s: String, _ queries: [String]) -> [Bool] {

        struct SegmentTree {
            private var tree: [Int]
            private let size: Int
            init(_ values: [Int]) {
                size = values.count
                tree = [Int](repeating: 0, count: size * 2)
                for i in values.indices {
                    tree[size + i] = values[i]
                }
                if size > 1 {
                    for i in stride(from: size - 1, through: 1, by: -1) {
                        tree[i] = tree[i * 2] ^ tree[i * 2 + 1]
                    }
                }
            }

            mutating func update(_ idx: Int, _ value: Int) {
                var treeIdx = size + idx
                tree[treeIdx] = value
                while treeIdx > 1 {
                    treeIdx /= 2
                    tree[treeIdx] = tree[treeIdx * 2] ^ tree[treeIdx * 2 + 1]
                }
            }

            func query(_ left: Int, _ right: Int) -> Int {
                var left = left + size
                var right = right + size
                var result = 0
                while left <= right {
                    if left % 2 == 1 {
                        result ^= tree[left]
                        left += 1
                    }
                    if right % 2 == 0 {
                        result ^= tree[right]
                        right -= 1
                    }
                    left /= 2
                    right /= 2
                }
                return result
            }
        }

        struct HLD {
            private var graph: [[Int]]
            private var parent: [Int]
            private var depth: [Int]
            private var size: [Int]
            private var heavy: [Int]
            private var head: [Int]
            private var pos: [Int]
            private var timer = 0
            private var seg: SegmentTree

            init(_ n: Int, _ edges: [[Int]], _ s: String) {
                graph = [[Int]](repeating: [], count: n)
                parent = [Int](repeating: -1, count: n)
                depth = [Int](repeating: 0, count: n)
                size = [Int](repeating: 0, count: n)
                heavy = [Int](repeating: -1, count: n)
                head = [Int](repeating: 0, count: n)
                pos = [Int](repeating: 0, count: n)
                seg = SegmentTree([Int](repeating: 0, count: n))
                for edge in edges {
                    graph[edge[0]].append(edge[1])
                    graph[edge[1]].append(edge[0])
                }
                dfs(0, -1)
                decompose(0, 0)
                for (node, char) in s.utf8.enumerated() {
                    let mask = 1 << Int(char - 97)
                    seg.update(pos[node], mask)
                }
            }

            private mutating func dfs(_ u: Int, _ p: Int) {
                parent[u] = p
                size[u] = 1
                for v in graph[u] where v != p {
                    depth[v] = depth[u] + 1
                    dfs(v, u)
                    size[u] += size[v]
                    if heavy[u] == -1 || size[v] > size[heavy[u]] {
                        heavy[u] = v
                    }
                }
            }

            private mutating func decompose(_ u: Int, _ h: Int) {
                head[u] = h
                pos[u] = timer
                timer += 1
                if heavy[u] != -1 {
                    decompose(heavy[u], h)
                }
                for v in graph[u] {
                    if v != parent[u] && v != heavy[u] {
                        decompose(v, v)
                    }
                }
            }

            mutating func update(_ node: Int, _ char: UInt8) {
                let mask = 1 << Int(char - 97)
                seg.update(pos[node], mask)
            }

            func queryPath(_ u: Int, _ v: Int) -> Bool {
                var u = u
                var v = v
                var mask = 0
                while head[u] != head[v] {
                    if depth[head[u]] < depth[head[v]] {
                        swap(&u, &v)
                    }
                    mask ^= seg.query(pos[head[u]], pos[u])
                    u = parent[head[u]]
                }
                if depth[u] > depth[v] {
                    swap(&u, &v)
                }
                mask ^= seg.query(pos[u], pos[v])
                return mask & (mask - 1) == 0
            }
        }

        var hld = HLD(n, edges, s)
        var answer = [Bool]()
        for query in queries {
            let parts = query.split(separator: " ")
            switch parts[0] {
            case "update":
                let node = Int(parts[1])!
                let char = parts[2].utf8.first!
                hld.update(node, char)
            case "query":
                let u = Int(parts[1])!
                let v = Int(parts[2])!
                answer.append(hld.queryPath(u, v))
            default:
                break
            }
        }
        return answer
    }
}
