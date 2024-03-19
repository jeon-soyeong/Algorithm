//
//  BOJ 거리.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/19.
//

import Foundation
//9
//BOJBOJBOJ
//-> 8
func solution12026() {
    let n = Int(readLine()!)!
    var array = Array(readLine()!).map { String($0) }
    var dp = Array(repeating: Int.max, count: n)
    dp[0] = 0
    
    for i in 1..<n {
        for j in 0..<i {
            switch array[i] {
            case "B":
                if array[j] == "J", dp[j] != Int.max {
                    dp[i] = min(dp[i], dp[j] + (i - j) * (i - j))
                }
            case "O":
                if array[j] == "B", dp[j] != Int.max {
                    dp[i] = min(dp[i], dp[j] + (i - j) * (i - j))
                }
            case "J":
                if array[j] == "O", dp[j] != Int.max {
                    dp[i] = min(dp[i], dp[j] + (i - j) * (i - j))
                }
            default:
                continue
            }
        }
    }
    
    print(dp.last == Int.max ? -1 : dp.last!)
}
