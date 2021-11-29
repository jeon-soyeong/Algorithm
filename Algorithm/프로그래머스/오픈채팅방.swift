//
//  오픈채팅방.swift
//  Algorithm
//
//  Created by 전소영 on 2021/11/29.
//

import Foundation

func solution(_ record: [String]) -> [String] {
    let records = record.map { $0.components(separatedBy: " ") }
    var recordId: [String: String] = [:]
    var result: [String] = []
    
    for record in records {
        if record[0] != "Leave" {
            recordId[record[1]] = record[2]
        }
    }

    for record in records {
        switch record[0] {
        case "Enter":
            result.append("\(recordId[record[1]]!)님이 들어왔습니다.")
        case "Leave":
            result.append("\(recordId[record[1]]!)님이 나갔습니다.")
        default:
            break
        }
    }

    return result
}
