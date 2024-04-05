//
//  동물원.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/05.
//

import Foundation

func solution1309() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 100001)
    
    dp[1] = 3
    dp[2] = 7
    
    if n >= 3 {
        for i in 3...n {
            dp[i] = (dp[i - 2] + 2 * dp[i - 1]) % 9901
        }
    }
    
    print(dp[n])
}
