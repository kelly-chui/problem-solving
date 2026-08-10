# https://leetcode.com/problems/cyclically-rotating-a-grid

class Solution:
    def rotateGrid(self, grid: List[List[int]], k: int) -> List[List[int]]:
        m, n = len(grid), len(grid[0])
        layerCount = min(m, n) // 2
        flattenLayers = [[] for _ in range(layerCount)]
        answer = []
        for layer in range(layerCount):
            for col in range(layer, n - 1 - layer):
                flattenLayers[layer].append(grid[layer][col])
            for row in range(layer, m - 1 - layer):
                flattenLayers[layer].append(grid[row][n - 1 - layer])
            for col in range(n - 1 - layer, layer, -1):
                flattenLayers[layer].append(grid[m - 1 - layer][col])
            for row in range(m - 1 - layer, layer, -1):
                flattenLayers[layer].append(grid[row][layer])
            shift = k % len(flattenLayers[layer])
            rotatedLayer = flattenLayers[layer][shift:] + flattenLayers[layer][:shift]
            rotatedLayerIdx = 0
            for col in range(layer, n - 1 - layer):
                grid[layer][col] = rotatedLayer[rotatedLayerIdx]
            it = iter(rotatedLayer)
            for col in range(layer, n - 1 - layer):
                grid[layer][col] = next(it)
            for row in range(layer, m - 1 - layer):
                grid[row][n - 1 - layer] = next(it)
            for col in range(n - 1 - layer, layer, -1):
                grid[m - 1 - layer][col] = next(it)
            for row in range(m - 1 - layer, layer, -1):
                grid[row][layer] = next(it)
        return grid
