# https://leetcode.com/problems/shift-2d-grid

class Solution:
    def shiftGrid(self, grid: List[List[int]], k: int) -> List[List[int]]:
        m = len(grid)
        n = len(grid[0])
        k = k % (n * m)
        flattenGrid = [x for row in grid for x in row]
        flattenGrid = flattenGrid[-k:] + flattenGrid[:-k]
        return [flattenGrid[i * n: (i + 1) * n] for i in range(m)]
