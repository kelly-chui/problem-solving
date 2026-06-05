# https://leetcode.com/problems/earliest-finish-time-for-land-and-water-rides-ii

class Solution:
    def earliestFinishTime(self, landStartTime: List[int], landDuration: List[int], waterStartTime: List[int], waterDuration: List[int]) -> int:
        minLandEnd = float("inf")
        minWaterEnd = float("inf")
        for i in range(len(landStartTime)):
            minLandEnd = min(
                minLandEnd,
                landStartTime[i] + landDuration[i]
            )
        for i in range(len(waterStartTime)):
            minWaterEnd = min(
                minWaterEnd,
                waterStartTime[i] + waterDuration[i]
            )
        answer = float("inf")
        # land first, water second
        for i in range(len(waterStartTime)):
            finish = max(minLandEnd, waterStartTime[i]) + waterDuration[i]
            answer = min(answer, finish)
        # water first, land second
        for i in range(len(landStartTime)):
            finish = max(minWaterEnd, landStartTime[i]) + landDuration[i]
            answer = min(answer, finish)
        return answer
