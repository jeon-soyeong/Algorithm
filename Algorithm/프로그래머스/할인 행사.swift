//
//  할인 행사.swift
//  Algorithm
//
//  Created by 전소영 on 2022/11/10.
//

import Foundation

func solution131127(_ want: [String], _ number: [Int], _ discount: [String]) -> Int {
    var wantDictionary: [String: Int] = [:]
    var discountDictionary: [String: Int] = [:]
    var answer = 0

    for i in 0..<want.count {
        wantDictionary[want[i]] = number[i]
    }

    for i in 0...discount.count - 10 {
        discountDictionary = [:]
        for j in i..<i + 10 {
            if let count = discountDictionary[discount[j]] {
                discountDictionary[discount[j]] = count + 1
            } else {
                discountDictionary[discount[j]] = 1
            }
        }
        if wantDictionary == discountDictionary {
            answer += 1
        }
    }

    return answer
}
