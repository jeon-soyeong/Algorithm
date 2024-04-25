//
//  파도반 수열.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/25.
//

import Foundation
//2
//6
//12
func solution9461() {
    let t = Int(readLine()!)!
    var array: [Int] = []
    var dp = Array(repeating: 0, count: 101)
    
    for _ in 0..<t {
        array.append(Int(readLine()!)!)
    }
    
    dp[1] = 1
    dp[2] = 1
    dp[3] = 1
    dp[4] = 2
    dp[5] = 2
    
    for i in 6...100 {
        dp[i] = dp[i - 1] + dp[i - 5]
    }
    
    for a in array {
        print(dp[a])
    }
}
