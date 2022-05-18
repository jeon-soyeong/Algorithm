//
//  다단계 칫솔 판매.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/18.
//

import Foundation

//    enroll ["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"]
//    referral ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"]
//    seller ["young", "john", "tod", "emily", "mary"]
//    amount [12, 4, 2, 5, 10]
//    result [360, 958, 108, 0, 450, 18, 180, 1080]
func solution77486(_ enroll: [String], _ referral: [String], _ seller: [String], _ amount: [Int]) -> [Int] {
    
    var profitDictionary: [String: Int] = [:]
    var parentDictionary: [String: String] = [:]
    
    for i in 0..<enroll.count {
        profitDictionary[enroll[i]] = 0
        parentDictionary[enroll[i]] = referral[i]
    }
    
    for i in 0..<seller.count {
        var profit = (amount[i] * 100)
        var parent = seller[i]
        while parent != "-", profit > 0 {
            profitDictionary[parent]! += profit - profit / 10
            parent = parentDictionary[parent]!
            profit = profit / 10
        }
    }

    return enroll.map { profitDictionary[$0]! }
}
