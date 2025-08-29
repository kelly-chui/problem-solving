def solution(numbers):
    def checkBinaryTree(start, end):
        if start == end: # 리프노드
            return True
        mid = (start + end) // 2
        left, right = False, False
        if binTree[mid] == "1":
            left = checkBinaryTree(start, mid - 1)
            right = checkBinaryTree(mid + 1, end)
        elif binTree[mid] == "0":
            return not "1" in binTree[start:end + 1]
        return left and right
    answer = []
    for number in numbers:
        binTree = bin(number)[2:]
        for power in range(1, 7):
            paddedLength = (2 ** power) - 1
            if len(binTree) <= paddedLength:
                binTree = ("0" * (paddedLength - len(binTree))) + binTree
                break
        answer.append(1 if checkBinaryTree(0, len(binTree) - 1) else 0)
    return answer
