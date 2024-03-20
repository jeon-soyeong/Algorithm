//
//  기타리스트.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/20.
//

import Foundation
//3 5 10
//5 3 7
//-> 10
func solution1495() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let s = input[1]
    let m = input[2]
    
    let v = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var answer = -1
    
    dp[0][s] = 1
    // dp =[[0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]]
    for i in 1...n {
        for j in 0...m {
            if dp[i - 1][j] != 0 {
                if 0...m ~= j + v[i - 1] {
                    dp[i][j + v[i - 1]] = 1
                }
                
                if 0...m ~= j - v[i - 1] {
                    dp[i][j - v[i - 1]] = 1
                }
            }
        }
    }
    
    answer = dp.last!.lastIndex(of: 1) ?? -1
    print(answer)
}
