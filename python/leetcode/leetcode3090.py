# https://leetcode.com/problems/maximum-length-substring-with-two-occurrences

class Solution:
    def maximumLengthSubstring(self, s: str) -> int:
        answer = 0
        for start in range(len(s)):
            frequencies = {}
            for end in range(start, len(s)):
                frequencies[s[end]] = frequencies.get(s[end], 0) + 1
                if frequencies[s[end]] > 2:
                    break
                answer = answer if answer > (end - start + 1) else (end - start + 1)
        return answer
