//
//  케익 배달.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/12.
//

import Foundation
//3
//2 2
//3 6
//6 7
//7 3
//-> 11
func solution2159() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: Int.max, count: 5), count: n + 1)
    var tuple: [[Int]] = []
    let dx = [-1, 1, 0, 0, 0]
    let dy = [0, 0, -1, 1, 0]
    
    for _ in 0...n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        tuple.append([input[0], input[1]])
    }
    
    for i in 0..<4 {
        dp[0][i] = 1
    }
    dp[0][4] = 0 // 중앙
    
    for i in 1...n {
        for j in 0..<5 {
            let x = tuple[i][0] + dx[j], y = tuple[i][1] + dy[j]
            
            for k in 0..<5 {
                let bx = tuple[i - 1][0] + dx[k], by = tuple[i - 1][1] + dy[k]
                dp[i][j] = min(dp[i][j], abs(ex - x) + abs(ey - y) + dp[i - 1][k])
            }
        }
    }
    
    print(dp[n].min()!)
}
