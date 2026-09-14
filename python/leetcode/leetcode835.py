# https://leetcode.com/problems/image-overlap

class Solution:
    def largestOverlap(self, img1: List[List[int]], img2: List[List[int]]) -> int:
        n = len(img1)
        img1Positive = [(row, col) for row in range(n) for col in range(n) if img1[row][col] == 1]
        img2Positive = [(row, col) for row in range(n) for col in range(n) if img2[row][col] == 1]
        count = {}
        for row1, col1 in img1Positive:
            for row2, col2 in img2Positive:
                diff = (row2 - row1, col2 - col1)
                count[diff] = count.get(diff, 0) + 1
        return max(count.values()) if count else 0
        