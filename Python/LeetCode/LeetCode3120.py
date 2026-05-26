# https://leetcode.com/problems/count-the-number-of-special-characters-i

class Solution:
    def numberOfSpecialChars(self, word: str) -> int:
        characters = set(word)
        answer = 0
        for c in string.ascii_lowercase:
            if c in characters and c.upper() in characters:
                answer += 1
        return answer
