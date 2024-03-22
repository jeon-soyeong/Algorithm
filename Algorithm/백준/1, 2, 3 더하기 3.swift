//
//  1, 2, 3 더하기 3.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/21.
//

import Foundation
//3
//4
//7
//10
//
//7
//44
//274
func solution15988() {
    let n = Int(readLine()!)!
    var array: [Int] = []
    
    for _ in 0..<n {
        array.append(Int(readLine()!)!)
    }
    
    var dp = Array(repeating: 0, count: 1000000)
    dp[0] = 1
    dp[1] = 2
    dp[2] = 4
    
    for i in 3..<1000000 {
        dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]) % 1000000009
    }
    
    for j in 0..<n {
        print(dp[array[j] - 1])
    }
}
