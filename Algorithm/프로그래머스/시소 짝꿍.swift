//
//  시소 짝꿍.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/22.
//

import Foundation

func solution152996(_ weights: [Int]) -> Int64 {
    var answer: Int64 = 0
    var dictionary: [Int: Int] = [:]
    let ratios = [[1, 1], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3]]
    
    for w in weights {
        for ratio in ratios {
            var r = w * ratio[0]
            if r % ratio[1] == 0 {
                r /= ratio[1]
                if dictionary[r] != nil {
                    answer += Int64(dictionary[r]!)
                }
            }
        }
        
        if dictionary[w] == nil {
            dictionary[w] = 1
        } else {
            dictionary[w]! += 1
        }
    }
    
    return answer
}
