#include <iostream>
#include <cstring>
#include <algorithm>
#include <vector>

using namespace std;

string t, p;
int answerCount = 0;
vector<int> answerList;

vector<int> makePi(){
    int pLen = (int)p.length();
    vector<int> pi(pLen,0);
    int j = 0;
    for(int i = 1; i < pLen; i++) {
        while(j >0 && p[i] != p[j]) {
            j = pi[j - 1];
        }
        if(p[i] == p[j]) {
            j++;
            pi[i] = j;
        }
    }
    return pi;
}

void kmp() {
    vector<int> pi = makePi();
    int tLen = (int)t.length();
    int pLen = (int)p.length();
    int pIdx = 0;
    for(int idx = 0; idx < tLen; idx++) {
        while(pIdx > 0 && t[idx] != p[pIdx]) {
            pIdx = pi[pIdx - 1];
        }
        if(t[idx] == p[pIdx]) {
            if(pIdx == pLen - 1) {
                answerList.push_back(idx - pLen + 2);
                pIdx = pi[pIdx];
                answerCount++;
            } else {
                pIdx++;
            }
        }
    }
}


int main() {
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    getline(cin, t);
    getline(cin, p);
    kmp();
    cout << answerCount << endl;
    for(int index: answerList) {
        cout << index << " ";
    }
    return 0;
}
