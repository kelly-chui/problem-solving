# https://leetcode.com/problems/rank-transform-of-an-array

class Solution:
    def arrayRankTransform(self, arr: List[int]) -> List[int]:
        sortedArr = sorted(arr)
        rankDict = {}
        rank = 1
        for element in sortedArr:
            if not element in rankDict:
                rankDict[element] = rank
                rank += 1
        return list(map(lambda x: rankDict[x] , arr))
