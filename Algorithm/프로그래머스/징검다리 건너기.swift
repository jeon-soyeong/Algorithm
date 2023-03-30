//
//  징검다리 건너기.swift
//  Algorithm
//  - 이분탐색
//  Created by 전소영 on 2023/03/30.
//

import Foundation
//stones                            k    result
//[2, 4, 5, 3, 2, 1, 4, 2, 5, 1]    3    3
func solution64062(_ stones: [Int], _ k: Int) -> Int {
    var left = 1
    var right = 200000000
    
    while left < right {
        let mid = (left + right) / 2 // 건널 수 있는 사람 수
        var zeroCount = 0
        var isEnabled = true
        
        for i in 0..<stones.count { // 효율성에서 for stone in stones X
            if stones[i] - mid <= 0 {
                zeroCount += 1
            } else {
                zeroCount = 0
            }
            
            if zeroCount >= k {
                isEnabled = false
                break
            } 
        }
        
        if !isEnabled {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}
