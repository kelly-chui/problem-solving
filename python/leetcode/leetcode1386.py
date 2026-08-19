# https://leetcode.com/problems/cinema-seat-allocation

class Solution:
    def maxNumberOfFamilies(self, n: int, reservedSeats: List[List[int]]) -> int:
        reservedTable = {}
        for seat in reservedSeats:
            reservedTable.setdefault(seat[0], set()).append(seat[1])
        
        answer = (n - len(reservedTable)) * 2
        
        for reserved in reservedTable.values():
            block1 = not reserved & {2, 3, 4, 5}
            block2 = not reserved & {4, 5, 6, 7}
            block3 = not reserved & {6, 7, 8, 9}
            
            if block1 and block3:
                answer += 2
            elif block1 or block2 or block3:
                answer += 1
        
        return answer
