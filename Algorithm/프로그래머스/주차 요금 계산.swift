//
//  주차 요금 계산.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/12.
//

import Foundation
//fees    [180, 5000, 10, 600]
//records  ["05:34 5961 IN",
//          "06:00 0000 IN",
//          "06:34 0000 OUT",
//          "07:59 5961 OUT",
//          "07:59 0148 IN",
//          "18:59 0000 IN",
//          "19:09 0148 OUT",
//          "22:59 5961 IN",
//          "23:00 5961 OUT"]
//result [14600, 34400, 5000]

func solution92341(_ fees: [Int], _ records: [String]) -> [Int] {
    var inOutRecordsDictionary: [String: [Int]] = [:]
    var feeArray: [(String, Int)] = []

    records.forEach {
        let data = $0.components(separatedBy: " ")
        let inOutTime = data[0]
        let carNumber = data[1]
        if inOutRecordsDictionary[carNumber] == nil {
            inOutRecordsDictionary[carNumber] = [convertTimeToMinute(time: inOutTime)]
        } else {
            inOutRecordsDictionary[carNumber]?.append(convertTimeToMinute(time: inOutTime))
        }
    }
    
    inOutRecordsDictionary.forEach {
        let totalFee = calculateFee(fees: fees, timeArray: $1)
        feeArray.append(($0, totalFee))
    }
    feeArray.sort(by: { $0.0 < $1.0 })
    
    return feeArray.map { $0.1 }
}

func calculateFee(fees: [Int], timeArray: [Int]) -> Int {
    var totalFee = 0
    var timeList = timeArray
    var totalParkingTime = 0
    
    if timeList.count % 2 != 0 {
        timeList.append(1439)
    }
    
    for i in 0..<timeList.count {
        if i % 2 != 0 {
            totalParkingTime += timeList[i] - timeList[i - 1]
        }
    }
    
    if totalParkingTime - fees[0] < 0 {
        totalFee = fees[1]
    } else {
        totalFee = fees[1] + Int(ceil(Double((totalParkingTime - fees[0])) / Double(fees[2]))) * fees[3]
    }
    
    return totalFee
}

func convertTimeToMinute(time: String) -> Int {
    var minute = 0
    let time = time.components(separatedBy: ":").map { Int($0) }
    minute = time[0]! * 60 + time[1]!
    
    return minute
}
