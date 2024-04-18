//
//  RGB거리.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/18.
//

import Foundation
//6
//30 19 5
//64 77 64
//15 19 97
//4 71 57
//90 86 84
//93 32 91
//
//208
func solution1149() {
    let n = Int(readLine()!)!
    var costs: [[Int]] = []
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n)
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        costs.append(input)
    }
    
    dp[0][0] = costs[0][0]
    dp[0][1] = costs[0][1]
    dp[0][2] = costs[0][2]
    
    for i in 1..<n {
        dp[i][0] = min(dp[i - 1][1] + costs[i][0], dp[i - 1][2] + costs[i][0])
        dp[i][1] = min(dp[i - 1][0] + costs[i][1], dp[i - 1][2] + costs[i][1])
        dp[i][2] = min(dp[i - 1][0] + costs[i][2], dp[i - 1][1] + costs[i][2])
    }
    
    print(dp[n - 1].min()!)
}
