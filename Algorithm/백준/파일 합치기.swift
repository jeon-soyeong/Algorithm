//
//  파일 합치기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/18.
//

import Foundation
//2
//4
//40 30 30 50
//15
//1 21 3 4 5 35 5 4 3 5 98 21 14 17 32
func solution11066() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let n = Int(readLine()!)!
        let testArray = readLine()!.split(separator: " ").map { Int(String($0))! }
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        var sum =  Array(repeating: 0, count: n + 1)
        
        for i in 1...n {
            sum[i] = sum[i - 1] + testArray[i - 1]
        }
        
        
        for length in 1..<n {
            for start in 1...n - length {
                let end = start + length
                dp[start][end] = Int.max
                
                for i in start..<end {
                    dp[start][end] = min(dp[start][end] , dp[start][i] + dp[i + 1][end] + sum[end] - sum[start - 1])
                }
            }
            
        }
        
        print(dp[1][n])
    }
}
