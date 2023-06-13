//
//  연속 펄스 부분 수열의 합.swift
//  Algorithm
//
//  Created by 전소영 on 2023/06/13.
//

import Foundation
//  [2, 3, -6, 1, 3, -1, 2, 4]
//  [1, -1, 1, -1 1, -1, 1, -1]
//  [2, -3, -6,-1, 3, 1, 2, -4]

//  [2, 3, -6, 1, 3, -1, 2, 4]
//  [-1, 1, -1 1, -1, 1, -1, 1]
//  [-2, 3, 6, 1, -3, -1, -2, 4]
func solution161988(_ sequence: [Int]) -> Int64 {
    var answer: Int64 = 0
    var pulse1 = Array(repeating: 1, count: sequence.count)
    var pulse2 = Array(repeating: -1, count: sequence.count)
    var subsequence1: [Int] = []
    var subsequence2: [Int] = []
    var dp1 = Array(repeating: -9999, count: sequence.count)
    var dp2 = Array(repeating: -9999, count: sequence.count)
    
    for i in 0..<sequence.count {
        if i % 2 == 0 {
            pulse1[i] = -1
            pulse2[i] = 1
        }
    }
    
    for i in 0..<sequence.count {
        subsequence1.append(pulse1[i] * sequence[i])
        subsequence2.append(pulse2[i] * sequence[i])
    }
    
    dp1[0] = subsequence1[0]
    dp2[0] = subsequence2[0]
    
    for i in 1..<sequence.count {
        dp1[i] = max(dp1[i - 1] + subsequence1[i], subsequence1[i])
        dp2[i] = max(dp2[i - 1] + subsequence2[i], subsequence2[i])
    }
    
    answer = Int64(max(dp1.max()!, dp2.max()!))
    
    return answer
}
