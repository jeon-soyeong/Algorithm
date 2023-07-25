//
//  카운트 다운.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/25.
//

import Foundation

func solution131129(_ target: Int) -> [Int] {
    var dp = Array(repeating: [0, 0], count: target + 1)
    
    for i in 1...target {
        if i <= 20 || i == 50 {
            dp[i][0] = 1
            dp[i][1] = 1
        } else if (i <= 60 && i % 3 == 0) || (i <= 40 && i % 2 == 0) {
            dp[i][0] = 1
            dp[i][1] = 0
        } else if 50...70 ~= i {
            dp[i][0] = 2
            dp[i][1] = 2
        } else if i < 70 {
            if i < 40 {
                dp[i][0] = 2
                dp[i][1] = 2
            } else {
                dp[i][0] = 2
                dp[i][1] = 1
            }
        } else {
            if dp[i - 60][0] == dp[i - 50][0] {
                dp[i][0] = dp[i - 50][0] + 1
                dp[i][1] = max(dp[i - 60][1], dp[i - 50][1] + 1)
            } else if dp[i - 60][0] > dp[i - 50][0] {
                dp[i][0] = dp[i - 50][0] + 1
                dp[i][1] = dp[i - 50][1] + 1
            } else {
                dp[i][0] = dp[i - 60][0] + 1
                dp[i][1] = dp[i - 60][1]
            }
        }
    }
  
    return dp[target]
}
