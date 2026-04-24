class Solution:
    def furthestDistanceFromOrigin(self, moves: str) -> int:
        answer = moves.count('R') - moves.count('L')
        numOfUnderbar = moves.count('_')
        return abs(answer) + numOfUnderbar

