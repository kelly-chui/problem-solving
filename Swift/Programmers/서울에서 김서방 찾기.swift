//
//  서울에서 김서방 찾기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/08/04.
//

func solution(_ seoul:[String]) -> String {
    return "김서방은 " + String(seoul.firstIndex(of: "Kim")!) + "에 있다"
}
