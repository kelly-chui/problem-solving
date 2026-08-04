// https://leetcode.com/problems/maximum-twin-sum-of-a-linked-list

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

class Solution {
public:
    int pairSum(ListNode* head) {
        ListNode *slow = head, *fast = head;
        while (fast && fast->next) {
            slow = slow->next;
            fast = fast->next->next;
        }
        ListNode *pre = nullptr, *cur = slow;
        while (cur != nullptr) {
            ListNode *next = cur->next;
            cur->next = pre;
            pre = cur;
            cur = next;
        }
        ListNode *start = head, *end = pre;
        int answer = 0;
        while (end != nullptr) {
            int valSum = start->val + end->val;
            answer = answer > valSum ? answer : valSum;
            start = start->next;
            end = end->next;
        }
        return answer;
    }
};
