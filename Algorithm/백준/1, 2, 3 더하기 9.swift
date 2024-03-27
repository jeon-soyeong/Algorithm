//
//  1, 2, 3 더하기 9.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/27.
//

import Foundation
//3
//4 2
//7 5
//10 6
//
//3
//37
//151

// dp[i][j] = i라는 임의의 수를 j개의 수식을 사용해 만드는 방법 갯수
func solution16195() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)
    dp[1][1] = 1
    dp[2][1] = 1
    dp[2][2] = 1
    dp[3][1] = 1
    dp[3][2] = 2
    dp[3][3] = 1
  
    for i in 4..<1001 {
        for j in 2..<i {
            dp[i][j] = (dp[i - 1][j - 1] + dp[i - 2][j - 1] + dp[i - 3][j - 1]) % 1000000009
        }
        dp[i][i] = 1
    }
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let n = input[0]
        let m = input[1]
        var sum = 0
        
        for j in 1...m {
            sum = (sum + dp[n][j]) % 1000000009
        }
        
        print(sum)
    }
}
