//
//  main.cpp
//  BOJ23567
//
//  Created by Kelly Chui on 2022/07/22.
//

#include <iostream>
#include <cstring>

using namespace std;

int main(void) {
    
    int n, k, size, ptrs = 0, ptre = 0, rin = 0, rout=0, mod=2, tembuf;
    cin >> n;
    cin >> k;
    size = n;
    tembuf = n;
    
    int* narr = new int[n];
    int* in_karr = new int[k + 1];
    int* out_karr = new int[k + 1];

    memset(in_karr, 0, (k + 1) * 4);
    memset(out_karr, 0, (k + 1) * 4);

    for (int i = 0; i < n; i++) {
        cin >> narr[i];
        if (out_karr[narr[i]] == 0) {
            rout++;
        }
        out_karr[narr[i]]++;
    }
    
    in_karr[narr[0]]++;
    out_karr[narr[0]]--;
    rin++;
    if (out_karr[narr[0]] == 0) {
        rout--;
    }
    
    while (true) {
        
        if (mod == 0 || mod == 1){
            switch (mod) {
            case 0:
                in_karr[narr[ptrs - 1]]--;
                if (in_karr[narr[ptrs - 1]] == 0) {
                    rin--;
                }
                if (out_karr[narr[ptrs - 1]] == 0) {
                    rout++;
                }
                out_karr[narr[ptrs - 1]]++;
                break;

            case 1:
                if (in_karr[narr[ptre]] == 0) {
                    rin++;
                }
                in_karr[narr[ptre]]++;
                out_karr[narr[ptre]]--;
                if (out_karr[narr[ptre]] == 0) {
                    rout--;
                }
                break;
            }
        }

        if (ptre == n - 1 && ptrs == n - 1) {
            break;
        }

        if (rout == k && rin == k) {
            if ((ptre - ptrs + 1) < tembuf) {
                tembuf = ptre - ptrs + 1;
            }
            ptrs++;
            mod = 0;
            continue;
        }

        if (rout == k && rin < k) {
            if (ptre == n - 1){
                break;
            }
            ptre++;
            mod = 1;
            continue;
        }

        if (rout < k && rin == k) {
            ptrs++;
            mod = 0;
            continue;
        }

        if (rout < k && rin < k) {
            if (ptre == n - 1){
                break;
            }
            ptre++;
            mod = 1;
            continue;
        }
    }
    if (tembuf == n){
        cout << "0" << endl;
    } else {
        cout << tembuf << endl;
    }
    return 0;
}
