//
//  행렬 곱셈 순서.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/16.
//

import Foundation

//3
//5 3
//3 2
//2 6
func solution11049() {
    let n = Int(readLine()!)!
    var array: [[Int]] = []
    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for _ in 0..<n {
        array.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    for number in 1..<n {
        for i in 0..<n - number {
            let j = i + number
            dp[i][j] = Int.max
            for k in i..<j {
                // 각 부분행렬의 곱셈 횟수 + 두 행렬의 곱셈 횟수
                dp[i][j] = min(dp[i][j], dp[i][k] + dp[k + 1][j] + array[i][0] * array[k][1] * array[j][1])
            }
        }
    }

    print(dp[0][n - 1])
}
