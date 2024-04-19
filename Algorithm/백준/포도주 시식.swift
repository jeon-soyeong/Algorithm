//
//  포도주 시식.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/19.
//

import Foundation
//6
//6
//10
//13
//9
//8
//1
func solution2156() {
    let n = Int(readLine()!)!
    var wines = Array(repeating: 0, count: 10001)
    var dp = Array(repeating: 0, count: 10001)
    
    for i in 1...n {
        wines[i] = Int(readLine()!)!
    }
    
    dp[1] = wines[1]
    dp[2] = wines[1] + wines[2]
    
    for i in stride(from: 3, through: n, by: 1) {
        dp[i] = max(dp[i - 2] + wines[i], dp[i - 3] + wines[i - 1] + wines[i]) // 현재 + 전전, 현재 + 이전 + 전전전
        dp[i] = max(dp[i - 1], dp[i]) // 현재 X
    }
    
    print(dp[n])
}
