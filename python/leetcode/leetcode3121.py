# https://leetcode.com/problems/count-the-number-of-special-characters-ii

class Solution:
    def numberOfSpecialChars(self, word: str) -> int:
        answer = 0
        lower = {}
        upper = {}
        for idx, char in enumerate(word):
            if char.islower():
                lower[char] = idx
            elif char.isupper():
                if char not in upper:
                    upper[char] = idx
        for lowerChar in string.ascii_lowercase:
            upperChar = lowerChar.upper()
            if lowerChar in lower and upperChar in upper:
                if lower[lowerChar] < upper[upperChar]:
                    answer += 1
        return answer
