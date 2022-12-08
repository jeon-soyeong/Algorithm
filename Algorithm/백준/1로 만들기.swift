//
//  1로 만들기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/12/08.
//

import Foundation

func solution1463() -> Int {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: n + 1)
    
    for i in 2..<n + 1 {
        dp[i] = dp[i - 1] + 1
        
        if i % 2 == 0 {
            dp[i] = min(dp[i / 2] + 1, dp[i])
        }
     
        if i % 3 == 0 {
            dp[i] = min(dp[i / 3] + 1, dp[i])
        }
    }
    
    return dp[n]
}
