# https://leetcode.com/problems/smallest-unique-subarray

class Solution:
    def smallestUniqueSubarray(self, nums: List[int]) -> int:
        BASE = 100003
        MOD = 1000000007

        powTable = [1] * (len(nums) + 1)
        for idx in range(1, len(nums) + 1):
            powTable[idx] = (powTable[idx - 1] * BASE) % MOD

        def rollingHashes(length: int) -> List[int]:
            currentHash = 0
            for idx in range(length):
                currentHash = (currentHash * BASE + nums[idx]) % MOD
            
            hashes = [currentHash]
            for idx in range(length, len(nums)):
                currentHash = (currentHash - nums[idx - length] * powTable[length - 1]) % MOD
                currentHash = (currentHash * BASE + nums[idx]) % MOD
                hashes.append(currentHash)
            
            return hashes

        def check(length: int) -> bool:
            frequencies = {}
            for rollingHash in rollingHashes(length = length):
                frequencies[rollingHash] = frequencies.get(rollingHash, 0) + 1
            
            return 1 in frequencies.values()

        def lowerBound() -> int:
            low = 1
            high = len(nums) + 1
            while low < high:
                mid = (low + high) // 2
                if check(length = mid):
                    high = mid
                else:
                    low = mid + 1
            
            return low

        return lowerBound()
