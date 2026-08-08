# https://leetcode.com/problems/find-the-lexicographically-smallest-valid-sequence

class Solution:
    def validSequence(self, word1: str, word2: str) -> List[int]:
        dp = [0] * (len(word1) + 1)
        for ptr1 in range(len(word1) - 1, -1, -1):
            dp[ptr1] = dp[ptr1 + 1]
            ptr2 = len(word2) - dp[ptr1 + 1] - 1
            if ptr2 >= 0 and word1[ptr1] == word2[ptr2]:
                dp[ptr1] = dp[ptr1 + 1] + 1
        ptr2 = 0
        hasChance = True
        answer = []
        for ptr1 in range(len(word1)):
            if ptr2 == len(word2):
                break
            if word1[ptr1] == word2[ptr2]:
                answer.append(ptr1)
                ptr2 += 1
            elif hasChance and dp[ptr1 + 1] >= len(word2) - ptr2 - 1:
                answer.append(ptr1)
                ptr2 += 1
                hasChance = False
        return answer if len(answer) == len(word2) else []
