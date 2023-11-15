//
//  메뉴 리뉴얼.swift
//  Algorithm
//
//  Created by 전소영 on 2021/11/30.
//

import Foundation
//orders                                             course     result
//["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]    [2,3,4]    ["AC", "ACDE", "BCFG", "CDE"]
func solution724111(_ orders: [String], _ course: [Int]) -> [String] {
    var dictionary: [String: Int] = [:]
    var result: [String] = []

    func combination(_ target: [Character], _ targetCount: Int, _ index: Int, _ temp: String) {
        if targetCount == temp.count {
            if dictionary[temp] == nil {
                dictionary[temp] = 0
            }
            dictionary[temp]! += 1
        }

        for i in index..<target.count {
            combination(target, targetCount, i + 1, temp + [target[i]])
        }
    }

    for c in course {
        for order in orders {
            combination(Array(order).sorted(by: <), c, 0, "")
        }
    }

    for c in course {
        let sortedDictionary = dictionary.filter { $0.key.count == c && $0.value >= 2 }.sorted { $0.value > $1.value }
        
        if sortedDictionary.isEmpty {
            continue
        }
        let maxValue = sortedDictionary.first!.value
        
        result.append(contentsOf: sortedDictionary.filter { $0.value == maxValue }.map { $0.key })
    }
    
    return result.sorted(by: <)

}
