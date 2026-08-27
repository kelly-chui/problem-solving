# https://leetcode.com/problems/lexicographically-smallest-permutation-greater-than-target

class Solution:
    def lexGreaterPermutation(self, s: str, target: str) -> str:
        def charToInt(c: str) -> int:
            return ord(c) - ord('a')

        def intToChar(i: int) -> str:
            return chr(ord('a') + i)

        def dfs(isGreater: bool) -> bool:
            if len(seq) == n:
                return isGreater
            currentTarget = charToInt(target[len(seq)])
            start = 0 if isGreater else currentTarget
            for idx in range(start, 26):
                if frequencies[idx] == 0:
                    continue
                seq.append(intToChar(idx))
                frequencies[idx] -= 1
                nextGreater = isGreater or idx > currentTarget
                if dfs(nextGreater):
                    return True
                frequencies[idx] += 1
                seq.pop()
            return False
        
        n = len(s)
        frequencies = [0] * 26
        for char in s:
            frequencies[charToInt(char)] += 1
        seq = []
        if dfs(False):
            return "".join(seq)
        return ""
