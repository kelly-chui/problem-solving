# https://leetcode.com/problems/find-x-value-of-array-i

class Solution:
    def resultArray(self, nums: List[int], k: int) -> List[int]:
            result = [0] * k
            dp = [0] * k
            for r in range(len(nums)):
                newDp = [0] * k
                for x in range(k):
                    if dp[x]:
                        newDp[(x * nums[r]) % k] += dp[x]
                newDp[nums[r] % k] += 1
                dp = newDp
                for x in range(k):
                    result[x] += dp[x]

            return result
