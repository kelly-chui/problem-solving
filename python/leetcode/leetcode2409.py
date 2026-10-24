# https://leetcode.com/problems/count-days-spent-together

class Solution:
    def countDaysTogether(self, arriveAlice: str, leaveAlice: str, arriveBob: str, leaveBob: str) -> int:
        def calendarToDay(calendar: str) -> int:
            month = int(calendar[:2])
            day = int(calendar[3:])
            daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
            return sum(daysPerMonth[:month - 1]) + day
            
        start = max(
            calendarToDay(calendar = arriveAlice),
            calendarToDay(calendar = arriveBob)
        )
        end = min(
            calendarToDay(calendar = leaveAlice),
            calendarToDay(calendar = leaveBob)
        )
        return end - start + 1 if end - start + 1 > 0 else 0
