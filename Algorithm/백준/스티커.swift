//
//  스티커.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/04.
//

import Foundation
//2
//5
//50 10 100 20 40
//30 50 70 10 60
//7
//10 30 10 50 100 20 40
//20 40 30 50 60 20 80
//
//260
//290
func solution9465() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var dp = Array(repeating: Array(repeating: 0, count: 100001), count: 2)
        var array: [[Int]] = []
        
        for _ in 0..<2 {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            array.append(input)
        }
        
        dp[0][1] = array[0][0]
        dp[1][1] = array[1][0]
        
        if 1 < n {
            for i in 2...n {
                dp[0][i] = max(dp[1][i - 1], dp[1][i - 2]) + array[0][i - 1]
                dp[1][i] = max(dp[0][i - 1], dp[0][i - 2]) + array[1][i - 1]
            }
        }
        
        print(max(dp[0][n], dp[1][n]))
    }
}
