# https://leetcode.com/problems/maximize-active-section-with-trade-ii

import math

class Solution:
    def maxActiveSectionsAfterTrade(self, s: str, queries: List[List[int]]) -> List[int]:
        n = len(s)
        blocks = []
        for c in s:
            if blocks and blocks[-1][0] == c:
                blocks[-1][1] += 1
            else:
                blocks.append([c, 1])
        m = len(blocks)
        blockStart = [0] * m
        blockEnd = [0] * m
        blockIndex = [0] * n
        pos = 0
        for i, (_, size) in enumerate(blocks):
            blockStart[i] = pos
            blockEnd[i] = pos + size - 1
            blockIndex[pos:pos + size] = [i] * size
            pos += size
        prefixOne = [0] * n
        for i, c in enumerate(s):
            prefixOne[i] = (prefixOne[i - 1] if i > 0 else 0) + (c == '1')
        delta = [
            (blocks[i-1][1] if i > 0 else 0) + (blocks[i+1][1] if i < m-1 else 0)
            if c == '1' else 0
            for i, (c, _) in enumerate(blocks)
        ]
        log = m.bit_length()
        sparse = [delta[:]]
        for j in range(1, log):
            prev = sparse[j - 1]
            sparse.append([
                max(prev[i], prev[i + (1 << (j - 1))])
                for i in range(m - (1 << j) + 1)
            ])

        def rangeMax(l, r):
            if l > r:
                return 0
            k = (r - l + 1).bit_length() - 1
            return max(sparse[k][l], sparse[k][r - (1 << k) + 1])

        def getGain(bi, l, r):
            if not (0 < bi < m - 1) or blocks[bi][0] != '1':
                return 0
            if blockStart[bi] < l or blockEnd[bi] > r:
                return 0
            left  = blockEnd[bi-1] - max(blockStart[bi-1], l) + 1
            right = min(blockEnd[bi+1], r) - blockStart[bi+1] + 1
            if left <= 0 or right <= 0:
                return 0
            return left + right

        answer = []

        for l, r in queries:
            base = prefixOne[-1]
            lb = blockIndex[l]
            rb = blockIndex[r]
            firstFull = lb + (l > blockStart[lb])
            lastFull  = rb - (r < blockEnd[rb])
            maxGain = rangeMax(firstFull + 1, lastFull - 1)
            for bi in [lb, lb + 1, rb - 1, rb]:
                if 0 <= bi < m:
                    maxGain = max(maxGain, getGain(bi, l, r))
            answer.append(base + maxGain)
        return answer
