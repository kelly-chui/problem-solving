# https://leetcode.com/problems/smallest-divisible-digit-product-i

class Solution:
    def smallestNumber(self, n: int, t: int) -> int:
        def productDigits(x: int) -> int:
            product = 1
            while x > 0:
                product *= x % 10
                x //= 10
            return product
        answer = n
        while productDigits(answer) % t != 0:
            answer += 1
        return answer
