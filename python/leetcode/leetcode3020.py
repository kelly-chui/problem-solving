class Solution:
    def maximumLength(self, nums: List[int]) -> int:
        numsCount = {}
        for num in nums:
            numsCount[num] = numsCount.get(num, 0) + 1
        answer = (numsCount[1] - 1 if numsCount[1] % 2 == 0 else numsCount[1]) if 1 in numsCount else 0
        for x in numsCount:
            if x == 1:
                continue
            length = 0
            cur = x
            while cur in numsCount:
                next_cur = cur * cur
                if numsCount[cur] >= 2 and next_cur in numsCount:
                    length += 2
                    cur = next_cur
                else:
                    length += 1
                    break
            answer = max(answer, length)
        return answer
