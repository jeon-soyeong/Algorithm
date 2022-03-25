//
//  신고 결과 받기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/03/25.
//

import Foundation

func getReportResult(_ id_list: [String], _ report: [String], _ k: Int) -> [Int] {
    var reportDictionary: [String: Set<String>] = [:]
    var reportSumDictionary: [String: Int] = [:]
    var resultArray: [Int] = []
    
    for list in id_list {
        reportSumDictionary[list] = 0
    }
    
    for info in report {
        let info = info.components(separatedBy: " ")
        if reportDictionary[info[1]] != nil {
            reportDictionary[info[1]]?.insert(info[0])
        } else {
            reportDictionary[info[1]] = [info[0]]
        }
    }
    
    for report in reportDictionary {
        if report.value.count >= k {
            for value in report.value {
                reportSumDictionary[value]! += 1
            }
        }
    }
    
    for id in id_list {
        resultArray.append(reportSumDictionary[id]!)
    }
    
    return resultArray
}
