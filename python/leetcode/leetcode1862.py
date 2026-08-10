# https://leetcode.com/problems/rotating-the-box

class Solution:
    def rotateTheBox(self, boxGrid: List[List[str]]) -> List[List[str]]:
        m, n = len(boxGrid), len(boxGrid[0])
        for r in range(m):
            empty = n - 1
            for c in range(n - 1, -1, -1):
                if boxGrid[r][c] == '*':
                    empty = c - 1
                elif boxGrid[r][c] == '#':
                    boxGrid[r][c] = '.'
                    boxGrid[r][empty] = '#'
                    empty -= 1
        answer = [[''] * m for _ in range(n)]
        for r in range(m):
            for c in range(n):
                answer[c][m - 1 - r] = boxGrid[r][c]
        return answer
