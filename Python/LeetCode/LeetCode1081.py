# https://leetcode.com/problems/smallest-subsequence-of-distinct-characters

class Solution:
    def smallestSubsequence(self, s: str) -> str:
        stack = []
        lastIndice = {}
        for idx, c in enumerate(s):
            lastIndice[c] = idx
        for idx, c in enumerate(s):
            if c in stack:
                continue
            while stack and c < stack[-1] and lastIndice[stack[-1]] > idx:
                stack.pop()
            stack.append(c)
        return "".join(stack)
