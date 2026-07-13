# https://leetcode.com/problems/sequential-digits

class Solution:
    def sequentialDigits(self, low: int, high: int) -> List[int]:
        answer = []
        seq = []
        def dfs(n: int):
            if n > 9:
                return
            seq.append(str(n))
            intSeq = int("".join(seq))
            if intSeq <= high:
                if low <= intSeq:
                    answer.append(intSeq)
                dfs(n = n + 1)
            seq.pop()
        for i in range(1, 10):
            dfs(n = i)
        return sorted(answer)
            