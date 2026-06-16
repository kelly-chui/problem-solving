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
        ListNode* current = head;
        int count = 1;
        while (current->next != nullptr) {
            current = current->next;
            count++;
        }
        int mid = count / 2;
        int* arr = new int[count - 1];
        current = head;
        int write = 0;
        for (int idx = 0; idx < count; idx++) {
            if (idx != mid) {
                arr[write] = current->val;
                write++;
            }
            current = current->next;
        }
        ListNode* newHead = new ListNode(arr[0]);
        ListNode* newCurrent = newHead;
        for (int idx = 1; idx < count - 1; idx++) {
            newCurrent->next = new ListNode(arr[idx]);
            newCurrent = newCurrent->next;
        }
        delete[] arr;
        return newHead;
    }
};
