//
//  1, 2, 3 더하기 6.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/25.
//

import Foundation
//3
//4
//7
//10
//
//3
//6
//20
func solution15991() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 100001)
    var array: [Int] = []
    
    for _ in 0..<n {
        array.append(Int(readLine()!)!)
    }
    
    dp[1] = 1
    dp[2] = 2
    dp[3] = 2
    dp[4] = 3
    dp[5] = 3
    dp[6] = 6
    
    for i in 7..<100001 {
        dp[i] = (dp[i - 2] + dp[i - 4] + dp[i - 6]) % 1000000009
    }
    
    for a in array {
        print(dp[a])
    }
}
