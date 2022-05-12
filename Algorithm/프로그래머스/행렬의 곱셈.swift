//
//  행렬의 곱셈.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/13.
//

import Foundation

//  [[2, 3, 2],     [[5, 4, 3],
//   [4, 2, 4],       [2, 4, 1]
//   [3, 1, 4]]       [3, 1, 1]]
//[[22, 22, 11], [36, 28, 18], [29, 20, 14]]

//[[1, 4],        [3, 3]
// [3, 2],        [3, 3]
// [4, 1]]
//[[15, 15], [15, 15], [15, 15]]

func solution12949(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
    var answer = Array(repeating: [Int](), count: arr1.count)
    
    for i in 0..<arr1.count {
        for j in 0..<arr2[0].count {
            var value = 0
            for k in 0..<arr2.count {
                value += arr1[i][k] * arr2[k][j]
            }
            answer[i].append(value)
        }
    }
    
    return answer
}
