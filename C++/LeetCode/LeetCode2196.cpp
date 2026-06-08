// https://leetcode.com/problems/create-binary-tree-from-descriptions

#include <vector>;
#include <map>;
#include <set>;
using namespace std;
 struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

class Solution {
public:
    TreeNode* createBinaryTree(vector<vector<int>>& descriptions) {
        TreeNode* answer = nullptr;
        map<int, TreeNode*> nodes;
        set<int> children;
        for (int idx = 0; idx < descriptions.size(); idx++) {
            const vector<int>& description = descriptions[idx];
            int parent = description[0];
            int child = description[1];
            int isLeft = description[2];
            if (!nodes[parent]) nodes[parent] = new TreeNode(parent);
            if (!nodes[child]) nodes[child] = new TreeNode(child);
            if (isLeft) {
                (*nodes[parent]).left = nodes[child];
            } else {
                (*nodes[parent]).right = nodes[child];
            }
            children.insert(child);
        }
        for (pair<const int, TreeNode*>& pair: nodes) {
            int value = pair.first;
            if (children.count(value) == 0) return pair.second;
        }
        return nullptr;
    }
};
