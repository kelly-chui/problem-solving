import sys

class AbsoluteHeap:
    heap = []

    def swap(self, a, b):
        buffer = self.heap[a]
        self.heap[a] = self.heap[b]
        self.heap[b] = buffer

    def insert(self, a):
        self.heap.append(a)
        curIdx = len(self.heap) - 1
        
        while curIdx > 0 and self.heap[curIdx][0] <= self.heap[(curIdx - 1) // 2][0]:
            if self.heap[curIdx][0] == self.heap[(curIdx - 1) // 2][0] and\
                self.heap[curIdx][1] >= self.heap[(curIdx - 1) // 2][1]:
                break
            self.swap(curIdx, (curIdx - 1) // 2)
            curIdx = (curIdx - 1) // 2
        
    def delete(self):
        if len(self.heap) == 0:
            return 0
        curIdx = 0
        self.swap(0, len(self.heap) - 1)
        min = self.heap.pop()

        while curIdx * 2 + 1 <= len(self.heap) - 1:
            lChildIdx = curIdx * 2 + 1
            rChildIdx = lChildIdx + 1
            mChildIdx = lChildIdx

            if rChildIdx <= len(self.heap) - 1 and self.heap[rChildIdx][0] <= self.heap[mChildIdx][0]:
                if self.heap[rChildIdx][0] == self.heap[mChildIdx][0] and\
                    self.heap[rChildIdx][1] >= self.heap[mChildIdx][1]:
                    mChildIdx = lChildIdx
                else:
                    mChildIdx = rChildIdx
            
            if self.heap[curIdx][0] > self.heap[mChildIdx][0]:
                self.swap(curIdx, mChildIdx)
                curIdx = mChildIdx
            elif self.heap[curIdx][0] == self.heap[mChildIdx][0] and\
                self.heap[curIdx][1] > self.heap[mChildIdx][1]:
                self.swap(curIdx, mChildIdx)
                curIdx = mChildIdx
            else:
                break
        return min[0] * min[1]

n = int(sys.stdin.readline())
absHeap = AbsoluteHeap()
for _ in range(n):
    x = int(sys.stdin.readline())
    if x == 0:
        print(absHeap.delete())
    else:
        if x >= 0:
            absHeap.insert((x, 1))
        else:
            absHeap.insert((abs(x), -1))

