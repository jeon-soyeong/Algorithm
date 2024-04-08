//
//  상자넣기.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/08.
//

import Foundation
// 8
// 1 6 2 5 7 3 5 6
// -> 5
func solution1965() {
    let n = Int(readLine()!)!
    var array = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: 0, count: n + 1)
    
    for i in 0..<n {
        dp[i] = 1
        for j in 0...i {
            if array[i] > array[j], dp[i] < dp[j] + 1 {
                dp[i] = dp[j] + 1
            }
        }
    }
    
    print(dp.max()!)
}
