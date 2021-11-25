//
//  카펫.swift
//  Algorithm
//  - 완전탐색
//  Created by 전소영 on 2021/11/25.
//

import Foundation

func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    var resultArray: [(Int, Int)] = []
    var result: [Int] = []
    
    for i in 1...yellow {
        if yellow % i == 0, (i + 2) * ((yellow / i) + 2) == brown + yellow {
            resultArray.append((i + 2, yellow / i + 2))
            break
        }
    }
    
    if resultArray[0].0 > resultArray[0].1 {
        result.append(resultArray[0].0)
        result.append(resultArray[0].1)
    } else {
        result.append(resultArray[0].1)
        result.append(resultArray[0].0)
    }
    
    return result
}
