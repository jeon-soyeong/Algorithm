//
//  1, 2, 3 더하기 4.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/25.
//

import Foundation
//3
//4
//7
//10
//
//4
//8
//14
func solution15989() {
    let n = Int(readLine()!)!
    var array: [Int] = []
    var dp = Array(repeating: Array(repeating: 0, count: 4), count: 10001)
    var answer: [Int] = []
    
    for _ in 0..<n {
        let input = Int(readLine()!)!
        array.append(input)
    }
    
    dp[1][1] = 1
    dp[2][1] = 1
    dp[2][2] = 1
    dp[3][1] = 1
    dp[3][2] = 1
    dp[3][3] = 1

    for i in 4..<10001 {
        dp[i][1] = dp[i - 1][1]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        dp[i][3] = dp[i - 3][1] + dp[i - 3][2] + dp[i - 3][3]
    }
    
    for j in 0..<array.count {
        answer.append(dp[array[j]][1] + dp[array[j]][2] + dp[array[j]][3])
    }
    
    for a in answer {
        print(a)
    }
}
