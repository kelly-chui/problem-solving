def solution(nums):
    answer = 0
    monsters = set([])
    for num in nums:
        monsters.add(num)
    answer = len(nums) / 2 if len(monsters) > len(nums) / 2 else len(monsters)
    return int(answer)