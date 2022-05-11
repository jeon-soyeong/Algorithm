//
//  땅따먹기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/11.
//

import Foundation

//land                              answer
//[[1,2,3,5],[5,6,7,8],[4,3,2,1]]    16

//[[4, 3, 2, 1],  [4, 3, 2, 1],
// [2, 2, 2, 1],  [5, 6, 6, 5],
// [6, 6, 6, 4],  [12, 12, 12, 10],
// [8, 7, 6, 5]]  [20, 19, 18, 17]]
func solution12913(_ land: [[Int]]) -> Int {
    var dp = land
    for i in 1..<land.count {
        for j in 0..<4 {
            for k in 0..<4 {
                if j == k { continue }
                dp[i][j] = max(dp[i][j], dp[i-1][k] + land[i][j])
            }
        }
    }
    return dp.last!.max()!
    
//    var array = land
//
//    for i in 1..<land.count {
//        array[i][0] += max(array[i-1][1], array[i-1][2], array[i-1][3])
//        array[i][1] += max(array[i-1][0], array[i-1][2], array[i-1][3])
//        array[i][2] += max(array[i-1][0], array[i-1][1], array[i-1][3])
//        array[i][3] += max(array[i-1][0], array[i-1][1], array[i-1][2])
//    }
//
//    return array.last!.max()!
}
