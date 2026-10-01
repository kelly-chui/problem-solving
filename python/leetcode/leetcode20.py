# https://leetcode.com/problems/valid-parentheses

class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        for c in s:
            if c in ["(", "{", "["]:
                stack.append(c)
            else:
                last = ""
                if not stack:
                    return False
                else:
                    last = stack[-1]
                if c == ")" and last == "(":
                    stack.pop()
                elif c == "}" and last == "{":
                    stack.pop()
                elif c == "]" and last == "[":
                    stack.pop()
                else:
                    return False
        if stack:
            return False
        return True
