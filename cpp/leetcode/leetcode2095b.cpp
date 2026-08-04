// https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

class Solution {
public:
    ListNode* deleteMiddle(ListNode* head) {
        if (head->next == nullptr) return nullptr;
        ListNode *ptr1 = head, *ptr2 = head, *prePtr;
        while (ptr2 != nullptr && ptr2->next != nullptr) {
            prePtr = ptr1;
            ptr1 = ptr1->next;
            ptr2 = ptr2->next->next;
        }
        prePtr->next = ptr1->next;
        return head;
    }
};
