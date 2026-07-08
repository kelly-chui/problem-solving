# https://leetcode.com/problems/concatenate-non-zero-digits-and-multiply-by-sum-ii

class Solution:
    def sumAndMultiply(self, s: str, queries: List[List[int]]) -> List[int]:
            MOD = 10 ** 9 + 7
            m = len(s)
            pow10 = [1] * (m + 1)
            preSum = [0] * (m + 1)
            preConcat = [0] * (m + 1)
            nonZeroCount = [0] * (m + 1)
            for i, c in enumerate(s):
                d = int(c)
                pow10[i + 1] = pow10[i] * 10 % MOD
                preSum[i + 1] = preSum[i] + d
                nonZeroCount[i + 1] = nonZeroCount[i] + (d != 0)
                if d != 0:
                    preConcat[i + 1] = (preConcat[i] * 10 + d) % MOD
                else:
                    preConcat[i + 1] = preConcat[i]
            answer = []
            for l, r in queries:
                cnt = nonZeroCount[r + 1] - nonZeroCount[l]
                total = preSum[r + 1] - preSum[l]
                x = (preConcat[r + 1] - preConcat[l] * pow10[cnt]) % MOD
                answer.append(x * total % MOD)
            return answer
