# https://leetcode.com/problems/rotated-digits

class Solution:
    def rotatedDigits(self, n: int) -> int:
        answer = 0
        same = {"0", "1", "8"}
        changed = {"2", "5", "6", "9"}
        for i in range(1, n + 1):
            isChanged = False
            isValid = True
            for c in str(i):
                if c in changed:
                    isChanged = True
                elif c not in same:
                    isValid = False
                    break
            if isValid and isChanged:
                answer += 1
        return answer
        