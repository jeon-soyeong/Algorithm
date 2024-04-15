//
//  선물 전달.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/16.
//

import Foundation

func solution1947() {
    let n = Int(readLine()!)!
    var dp = [0, 0, 1, 2]
    
    while dp.count <= n {
        let lastIndex = dp.count - 1
        dp.append((lastIndex * (dp[lastIndex] + dp[lastIndex - 1])) % 1000000000)
    }
    
    print(dp[n])
}
