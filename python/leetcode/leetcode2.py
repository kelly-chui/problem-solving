class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        last = {}
        left = 0
        answer = 0
        for right, char in enumerate(s):
            if char in last and last[char] >= left:
                left = last[char] + 1
            last[char] = right
            answer = max(answer, right - left + 1)
        return answer
