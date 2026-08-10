class Heap:
    heap = []
    
    def insert(self, value):
        heap = self.heap
        heap.append(value)
        curIdx = len(heap) - 1

        while curIdx > 0 and heap[curIdx][1] > heap[(curIdx - 1) // 2][1]:
            heap[curIdx], heap[(curIdx - 1) // 2] = heap[(curIdx - 1) // 2], heap[curIdx]
            curIdx = (curIdx - 1) // 2
    
    def delete(self):
        heap = self.heap
        min = heap[0]
        heap[0], heap[len(heap) - 1] = heap[len(heap) - 1], heap[0]
        heap.pop()
        curIdx = 0

        while curIdx * 2 + 1 <= len(heap) - 1:
            lChildIdx = curIdx * 2 + 1
            rChlidIdx = lChildIdx + 1
            mChildIdx = lChildIdx
            
            if rChlidIdx <= len(heap) - 1 and heap[rChlidIdx][1] < heap[mChildIdx][1]:
                mChildIdx = rChlidIdx
            if heap[mChildIdx][1] < heap[curIdx][1]:
                heap[mChildIdx], heap[curIdx] = heap[curIdx], heap[mChildIdx]
            else:
                break 
        return min

def dijkstra(start):
    global m
    heap = Heap()
    heap.insert((start, 0))
    distances = [999_999_999] * (n + 1)
    distances[start] = 0
    
    while heap.heap:
        (node, dist) = heap.delete()
        if distances[node] < dist:
            continue
        for (newNode, newDist) in graph[node]:
            if distances[newNode] > dist + newDist:
                distances[newNode] = dist + newDist
                heap.insert((newNode, distances[newNode]))
    return distances

n, m, r = map(int, input().split())
t = list(map(int, input().split()))
graph = [[] for _ in range(n + 1)]
for _ in range(r):
    a, b, l = map(int, input().split())
    graph[a].append((b, l))
    graph[b].append((a, l))

items = []
for start in range(1, n + 1):
    item = 0
    distances = dijkstra(start)
    for i in range(1, len(distances)):
        if distances[i] <= m:
            item += t[i - 1]
    items.append(item)
print(max(items))
