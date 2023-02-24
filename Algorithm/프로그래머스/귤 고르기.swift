//
//  귤 고르기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/02/24.
//

import Foundation
// k = 6 [1: 1],[2: 2],[3: 2],[4: 1], [5: 2]  3
// k = 4 [1: 1],[2: 2],[3: 2],[4: 1], [5: 2]  2
// k = 2 [1: 4],[2: 3],[3: 1]                 1
func solution138476(_ k: Int, _ tangerine: [Int]) -> Int {
    var tangerineDictionary: [Int: Int] = [:]
    var total = 0
    var answer = 0
    
    for size in tangerine {
        if tangerineDictionary[size] != nil {
            tangerineDictionary[size]! += 1
        } else {
            tangerineDictionary[size] = 1
        }
    }
    
    var sortedDictionary = tangerineDictionary.sorted(by: { $0.value > $1.value })
   
    while total < k {
        total += sortedDictionary.first?.value ?? 0
        answer += 1
        sortedDictionary.removeFirst()
    }
    
    return answer
}
