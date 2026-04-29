# https://leetcode.com/problems/minimum-operations-to-make-a-uni-value-grid

class Solution:
    def minOperations(self, grid: List[List[int]], x: int) -> int:
        flatGrid = sorted([num for row in grid for num in row])
        remainder = flatGrid[0] % x
        modeList = []
        for element in flatGrid:
            if element % x == remainder:
                continue
            else:
                return -1
        answer = 0
        median = flatGrid[len(flatGrid) // 2]
        for element in flatGrid:
            answer += abs(element - median) // x
        return answer
