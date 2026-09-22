# https://leetcode.com/problems/reverse-degree-of-a-string

class Solution:
    def reverseDegree(self, s: str) -> int:
        reversedTable = dict(zip("abcdefghijklmnopqrstuvwxyz", range(26, 0, -1)))
        answer = 0
        for i in range(len(s)):
            answer += ((i + 1) * reversedTable[s[i]])
        return answer
