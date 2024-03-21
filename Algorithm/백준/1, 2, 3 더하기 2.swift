//
//  1, 2, 3 더하기 2.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/21.
//

import Foundation
//4 3
// -> 1+2+1
func solution12101() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], k = input[1]
    var dp = Array(repeating: [String](), count: 12)
    
    dp[1] = ["1"]
    dp[2] = ["1+1", "2"]
    dp[3] = ["1+1+1", "1+2", "2+1", "3"]
    
    for i in 4...11 {
        dp[i].append(contentsOf: dp[i - 1].map { $0 + "+1" })
        dp[i].append(contentsOf: dp[i - 2].map { $0 + "+2" })
        dp[i].append(contentsOf: dp[i - 3].map { $0 + "+3" })
        dp[i].sort()
    }
    
    if dp[n].count < k {
        print(-1)
    } else {
        print(dp[n][k - 1])
    }
}
