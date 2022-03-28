//
//  추석 트래픽.swift
//  Algorithm
//
//  Created by 전소영 on 2022/03/25.
//

import Foundation

func solution(_ lines: [String]) -> Int {
    var process: [LogData] = []
    
    for line in lines {
        let split = line.components(separatedBy: .whitespaces)
        let dates = split[0].components(separatedBy: "-")
        let year = dates[0]
        let month = dates[1]
        let day = dates[2]
        let time = split[1].components(separatedBy: ":")
        let hour = time[0]
        let min = time[1]
        let sec = time[2]
        let data = LogData(year: year,
                           month: month,
                           day: day,
                           hour: hour,
                           min: min,
                           sec: sec,
                           excute: split[2])
        process.append(data)
    }
    
    var maxCount = 0
    for i in 0..<process.count {
        var count = 1
        let end = process[i].endTime
        for j in i + 1..<process.count {
            if process[j].startTime < end + 1000 {
                count += 1
            }
        }
        maxCount = max(count, maxCount)
    }
    
    return maxCount
}

struct LogData {
    let year: String
    let month: String
    let day: String
    let hour: String
    let min: String
    let sec: String
    var excute: String
    var endTime: Double {
        let mhourF = Double(hour)! * 60 * 60 * 1000
        let mminF = Double(min)! * 60 * 1000
        let msecF = Double(sec)! * 1000
        return mhourF + mminF + msecF
    }
    
    var startTime: Double {
        let mhourF = Double(hour)! * 60 * 60 * 1000
        let mminF = Double(min)! * 60 * 1000
        let msecF = Double(sec)! * 1000
        var temp = excute
        temp.removeLast()
        let mExcuteF = Double(temp)! * 1000 - 1
        let mTotal = mhourF + mminF + msecF
        return Double(mTotal - mExcuteF)
    }
}
