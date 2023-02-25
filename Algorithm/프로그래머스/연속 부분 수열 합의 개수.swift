//
//  연속 부분 수열 합의 개수.swift
//  Algorithm
//
//  Created by 전소영 on 2023/02/24.
//

import Foundation
// elements        result
// [7,9,1,1,4]    18
func solution131701(_ elements: [Int]) -> Int {
    var totalSet: Set<Int> = []
    for i in 0..<elements.count {
        var count = 0
        for j in 0..<elements.count {
            let index = (i + j) % elements.count
            count += elements[index]
            totalSet.insert(count)
        }
    }
    
    return totalSet.count
}
