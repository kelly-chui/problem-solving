# https://leetcode.com/problems/minimum-add-to-make-parentheses-valid

class Solution:
    def minAddToMakeValid(self, s: str) -> int:
        answer = 0
        stack = []
        for c in s:
            if c == "(":
                stack.append(c)
            else:
                if not stack:
                    answer += 1
                else:
                    stack.pop()
        answer += len(stack)
        return answer
