//
//  쉬운 계단 수.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/22.
//

import Foundation

func solution10844() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)
    let mod = 1000000000
    
    for i in 1...9 {
        dp[1][i] = 1
    }
    
    if n > 1 {
        for i in 2...n {
            dp[i][0] = dp[i - 1][1] % mod
            dp[i][9] = dp[i - 1][8] % mod
            
            for j in 1...8 {
                dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % mod
            }
        }
    }
    
    print(dp[n].reduce(0, +) % mod)
}
