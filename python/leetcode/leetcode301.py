# https://leetcode.com/problems/remove-invalid-parentheses

class Solution:
    def removeInvalidParentheses(self, s: str) -> list[str]:
        leftRem = 0
        rightRem = 0
        for char in s:
            if char == "(":
                leftRem += 1
            elif char == ")":
                if leftRem > 0:
                    leftRem -= 1
                else:
                    rightRem += 1
        sCount = len(s)
        answer = set()
        
        def dfs(idx, current, leftRem, rightRem, leftCount, rightCount):
            if leftRem < 0 or rightRem < 0:
                return
            if rightCount > leftCount:
                return
            if idx == sCount:
                if leftRem == 0 and rightRem == 0:
                    answer.add(current)
                return

            char = s[idx]
            if char == "(":
                dfs(idx+1, current+char, leftRem, rightRem, leftCount+1, rightCount)
                dfs(idx+1, current, leftRem-1, rightRem, leftCount, rightCount)
            elif char == ")":
                dfs(idx+1, current+char, leftRem, rightRem, leftCount, rightCount+1)
                dfs(idx+1, current, leftRem, rightRem-1, leftCount, rightCount)
            else:
                dfs(idx+1, current+char, leftRem, rightRem, leftCount, rightCount)

        dfs(0, "", leftRem, rightRem, 0, 0)
        return list(answer) if answer else [""]
