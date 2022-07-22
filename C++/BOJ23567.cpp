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
    
    // 변수 초기화
    int n, k, size, ptrs = 0, ptre = 0, rin = 0, rout=0, mod=2, tembuf;

    cin >> n;
    cin >> k;
    size = n;
    tembuf = n;
    
    int* narr = new int[n]; // 전체 배열
    int* in_karr = new int[k + 1]; // 바깥쪽
    int* out_karr = new int[k + 1]; // 내부

    memset(in_karr, 0, (k + 1) * 4);
    memset(out_karr, 0, (k + 1) * 4);

    // 초기 작업 (첫 루프)
    for (int i = 0; i < n; i++) { // rout 채우기
        cin >> narr[i];
        if (out_karr[narr[i]] == 0) {
            rout++;
        }
        out_karr[narr[i]]++;
    }
    
    in_karr[narr[0]]++;
    out_karr[narr[0]]--;
    rin++;
    if (out_karr[narr[0]] == 0){
        rout--;
    }
    
    // Main Loop
    while (true) {
        
        //cout << "ptrs: " << ptrs << ", ptre: " << ptre << endl;
        if (mod == 0 || mod == 1){
            switch (mod) {
            case 0: // ptrs 증가했을때
                //내부
                in_karr[narr[ptrs - 1]]--;
                if (in_karr[narr[ptrs - 1]] == 0) {
                    rin--;
                }
                //외부
                if (out_karr[narr[ptrs - 1]] == 0) {
                    rout++;
                }
                out_karr[narr[ptrs - 1]]++;
                break;

            case 1: // ptre 증가했을때
                //내부
                if (in_karr[narr[ptre]] == 0) {
                    rin++;
                }
                in_karr[narr[ptre]]++;
                //외부
                out_karr[narr[ptre]]--;
                if (out_karr[narr[ptre]] == 0) {
                    rout--;
                }
                break;
            }
        }
        /*
        cout << "rin: " << rin << ", rout: " << rout << endl;
        cout << "rout:";
        for (int i = 0; i <= k; i++){
            cout << out_karr[i];
        }
        cout << endl << "rin: ";
        for (int i = 0; i <= k; i++){
            cout << in_karr[i];
        }
        cout << endl;
         */
        if (ptre == n - 1 && ptrs == n - 1) { // 둘다 끝에 도달했을 때
            break;
        }

        if (rout == k && rin == k) { // double rainbow -> ptrs를 증가시켜 내부 박스의 크기를 줄이고 그래도 다시 되는지 판정 必
            if ((ptre - ptrs + 1) < tembuf) { // double rainbow를 만족하고 기존의 double rainbow의 최소 크기보다 작다면 tembuf 값 갱신
                tembuf = ptre - ptrs + 1;
            }
            ptrs++;
            mod = 0;
            //cout << "Double Rainbow! tembuf = "<< tembuf << endl;
            //cout << "Loop end\n\n" << endl;
            continue;
        }

        if (rout == k && rin < k) { // 외부 충족, 내부 안됨 -> ptre 증가
            if (ptre == n - 1){ // 외부 충족하고 내부 안되는데 ptre를 증가시킬 수 없을때 (이미 ptre가 인덱스의 끝에 있을때)
                break;
            }
            ptre++;
            mod = 1;
            //cout << "In: X, Out: Ok, ptre++" << endl;
            //cout << "Loop end\n\n" << endl;
            continue;
        }

        if (rout < k && rin == k) { // 내부 충족, 외부 안됨 -> ptrs 증가
            ptrs++;
            mod = 0;
            //cout << "Loop end\n\n" << endl;
            continue;
        }

        if (rout < k && rin < k) { // 둘다 안 될때 -> 내부를 먼저 충족시키는걸 기준으로 정했으므로 ptre 증가
            if (ptre == n - 1){
                break;
            }
            ptre++;
            mod = 1;
            //cout << "Loop end\n\n" << endl;
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
