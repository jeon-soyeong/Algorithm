//
//  점프.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/28.
//

import Foundation
//4
//2 3 3 1
//1 2 1 3
//1 2 3 1
//3 1 1 0

//3
//dp[i][j] ij까지 올 수 있는 경로의 수
func solution1890() {
    let n = Int(readLine()!)!
    var array: [[Int]] = []
    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        array.append(input)
    }
    
    dp[0][0] = 1
    
    for i in 0..<n {
        for j in 0..<n {
            if dp[i][j] == 0 || (i == n - 1 && j == n - 1) {
                continue
            }
            let right = array[i][j] + j
            let down = array[i][j] + i
            
            if right < n {
                dp[i][right] += dp[i][j]
            }
            
            if down < n {
                dp[down][j] += dp[i][j]
            }
        }
    }
    
    print(dp[n - 1][n - 1])
}
