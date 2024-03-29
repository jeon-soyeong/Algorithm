//
//  크리보드.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/29.
//

import Foundation

func solution11058() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: n + 1)
    
    for i in 0..<n + 1 {
        dp[i] = i
    }
    
    if n >= 7 {
        for i in 7...n {
            for j in 3...i {
                dp[i] = max(dp[i], dp[i - j] * (j - 1))
            }
        }
    }
    
    print(dp[n])
}
