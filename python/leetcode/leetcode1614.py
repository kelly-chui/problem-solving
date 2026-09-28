# https://leetcode.com/problems/maximum-nesting-depth-of-the-parentheses

class Solution:
    def maxDepth(self, s: str) -> int:
        answer = 0
        depth = 0
        stack = []
        for c in s:
            if c == "(":
                stack.append(c)
                depth += 1
                answer = max(depth, answer)
            elif c == ")":
                stack.pop()
                depth -= 1
        return answer
