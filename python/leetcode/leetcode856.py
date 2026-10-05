# https://leetcode.com/problems/score-of-parentheses

class Solution:
    def scoreOfParentheses(self, s: str) -> int:
        idx = [0]
        def dfs() -> int:
            idx[0] += 1
            score = 0
            while s[idx[0]] != ')':
                if s[idx[0]] == '(':
                    score += dfs()
                idx[0] += 1
            return 1 if score == 0 else 2 * score
        total = 0
        while idx[0] < len(s):
            if s[idx[0]] == '(':
                total += dfs()
            idx[0] += 1
        return total
