# https://leetcode.com/problems/angle-between-hands-of-a-clock

class Solution:
    def angleClock(self, hour: int, minutes: int) -> float:
        hourDegree = (hour % 12) * 30 + minutes * 0.5
        minutesDegree = minutes * 6
        diff = abs(hourDegree - minutesDegree)
        return diff if diff < 360 - diff else 360 - diff
