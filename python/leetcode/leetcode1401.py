# https://leetcode.com/problems/circle-and-rectangle-overlapping

class Solution:
    def checkOverlap(self, radius: int, xCenter: int, yCenter: int, x1: int, y1: int, x2: int, y2: int) -> bool:
        def distanceToCenter(x: int, y: int) -> int:
            return math.sqrt((x - xCenter) ** 2 + (y - yCenter) ** 2)
        isXIn = x1 <= xCenter and xCenter <= x2
        isYIn = y1 <= yCenter and yCenter <= y2
        answer = False
        if isXIn and isYIn:
            answer = True
        elif isXIn and (not isYIn):
            answer = distanceToCenter(xCenter, y1) <= radius or distanceToCenter(xCenter, y2) <= radius
        elif (not isXIn) and isYIn:
            answer = distanceToCenter(x1, yCenter) <= radius or distanceToCenter(x2, yCenter) <= radius
        elif not (isXIn and isYIn):
            for x, y in [(x1, y1), (x2, y2), (x1, y2), (x2, y1)]:
                if distanceToCenter(x, y) <= radius:
                    answer = True
        return answer
