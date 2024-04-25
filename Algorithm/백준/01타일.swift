//
//  01타일.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/25.
//

import Foundation

func solution1904() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 1000001)

    dp[1] = 1
    dp[2] = 2

    for i in 3...1000000 {
        dp[i] = (dp[i - 2] + dp[i - 1]) % 15746
    }

    print(dp[n])
}
