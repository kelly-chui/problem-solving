# https://leetcode.com/problems/rotate-list

# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        if head is None:
            return head
        current = head
        length = 1
        while current.next is not None:
            current = current.next
            length += 1
        tail = current
        k %= length
        if k == 0:
            return head
        tail.next = head
        current = head
        for _ in range(length - k - 1):
            current = current.next
        newTail = current
        newHead = newTail.next
        newTail.next = None
        return newHead
    
