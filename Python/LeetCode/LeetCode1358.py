# https://leetcode.com/problems/number-of-substrings-containing-all-three-characters

class Solution:
    def numberOfSubstrings(self, s: str) -> int:
        answer = 0
        abc = {"a": 0, "b": 0, "c": 0}
        start = 0
        for end in range(len(s)):
            abc[s[end]] += 1
            while abc["a"] > 0 and abc["b"] > 0 and abc["c"] > 0:
                answer += len(s) - end
                abc[s[start]] -= 1 
                start += 1
        return answer
