//
//  신고 결과 받기.swift
//  ProgrammersAlgorithm
//
//  Created by Kelly Chui on 2022/09/26.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let newReport = Set(report)
    var report_list: [String: [String]] = [:]
    var report_count: [String: Int] = [:]
    var bannedId: [String] = []
    var answer: [Int] = []
    
    for id in id_list {
        report_list[id] = []
        report_count[id] = 0
    }
    
    for r in newReport {
        var temp = r.components(separatedBy: " ")
        report_count[temp[1]]! += 1
        report_list[temp[0]]!.append(temp[1])
    }

    for (key, value) in report_count {
        if value >= k {
            bannedId.append(key)
        }
    }
    
    for id in id_list {
        answer.append(Set(report_list[id]!).intersection(Set(bannedId)).count)
    }
    
    return answer
}
