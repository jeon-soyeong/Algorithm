//
//  1, 2, 3 더하기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/12/12.
//

import Foundation
// 3
// 4    7
// 7    44
// 10   274
func solution9095() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 10)
    dp[0] = 1
    dp[1] = 2
    dp[2] = 4

    for i in 3..<10 {
        dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
    }
    
    for _ in 0..<n {
        let number = Int(readLine()!)!
        print(dp[number - 1])
    }
}
