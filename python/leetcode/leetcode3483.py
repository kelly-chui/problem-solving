# https://leetcode.com/problems/unique-3-digit-even-numbers

class Solution:
    def totalNumbers(self, digits: List[int]) -> int:
        answerSet = set()
        for first in range(len(digits)):
            if digits[first] == 0:
                continue
            for second in range(len(digits)):
                if first == second:
                    continue
                for third in range(len(digits)):
                    if digits[third] % 2 != 0:
                        continue
                    if third == first or third == second:
                        continue
                    answerSet.add(100 * digits[first] + 10 * digits[second] + digits[third])
        return len(answerSet)
