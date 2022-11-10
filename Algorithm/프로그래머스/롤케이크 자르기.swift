//
//  롤케이크 자르기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/11/10.
//

import Foundation

func solution132265(_ topping: [Int]) -> Int {
    var answer = 0
    var toppingDictionary: [Int: Int] = [:]
    var toppingSet: Set<Int> = []

    for i in topping {
        if let count = toppingDictionary[i] {
            toppingDictionary[i] = count + 1
        } else {
            toppingDictionary[i] = 1
        }
    }

    for i in topping {
        if let count = toppingDictionary[i] {
            toppingDictionary[i] = count - 1
        }
        toppingSet.insert(i)

        if toppingDictionary[i] == 0 {
            toppingDictionary.removeValue(forKey: i)
        }

        if toppingDictionary.count == toppingSet.count {
            answer += 1
        }
    }

    return answer
}
