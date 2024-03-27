//
//  1, 2, 3 더하기 8.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/27.
//

import Foundation
//3
//4
//7
//10
//
//3 4
//22 22
//137 137
func solution15993() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: 100001)
    
    //dp[i][0] = 짝, dp[i][1] = 홀
    dp[1][1] = 1
    dp[2][0] = 1
    dp[2][1] = 1
    dp[3][0] = 2
    dp[3][1] = 2
    
    for i in 4..<100001 {
        dp[i][1] = (dp[i - 1][0] + dp[i - 2][0] + dp[i - 3][0]) % 1000000009
        dp[i][0] = (dp[i - 1][1] + dp[i - 2][1] + dp[i - 3][1]) % 1000000009
    }
    
    for _ in 0..<n {
        let input = Int(readLine()!)!
        print("\(dp[input][1] % 1000000009) \(dp[input][0] % 1000000009)")
    }
}
