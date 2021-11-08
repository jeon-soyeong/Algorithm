//
//  더 맵게.swift
//  Algorithm
//  - 힙(Heap)
//  Created by 전소영 on 2021/11/05.
//

import Foundation

func solution(scoville: [Int], K: Int) -> Int {
    var result = 0
    var sortedScovilleArray = scoville.sorted()
    
    while sortedScovilleArray.contains(where: { $0 < K }) {
        var currentSum = 0
        result += 1
        sortedScovilleArray = sortedScovilleArray.sorted()
        
        for i in 1...2 {
            let current = sortedScovilleArray.removeFirst()
            if i == 1 {
                currentSum += current
            } else {
                currentSum += current * 2
            }
        }
        
        sortedScovilleArray.append(currentSum)
    }
    
    return result
}
