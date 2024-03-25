//
//  1, 2, 3 더하기 5.swift
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
//3
//9
//27
func solution15990() {
    let n = Int(readLine()!)!
    var array: [Int] = []
    var dp = Array(repeating: Array(repeating: 0, count: 4), count: 100001)
    
    for _ in 0..<n {
        array.append(Int(readLine()!)!)
    }
    
    dp[1][1] = 1
    dp[2][1] = 0
    dp[2][2] = 1
    dp[3][1] = 1
    dp[3][2] = 1
    dp[3][3] = 1
    
    for i in 4..<100001 {
        dp[i][1] = (dp[i - 1][2] + dp[i - 1][3]) % 1000000009
        dp[i][2] = (dp[i - 2][1] + dp[i - 2][3]) % 1000000009
        dp[i][3] = (dp[i - 3][1] + dp[i - 3][2]) % 1000000009
    }
    
    for a in array {
        print((dp[a][1] + dp[a][2] + dp[a][3]) % 1000000009)
    }
}
