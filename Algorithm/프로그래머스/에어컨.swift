//
//  에어컨.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/08.
//

import Foundation

func solution214289(_ temperature: Int, _ t1: Int, _ t2: Int, _ a: Int, _ b: Int, _ onboard: [Int]) -> Int {
    let temperature = temperature + 10
    let t1 = t1 + 10
    let t2 = t2 + 10
    var dp = Array(repeating: Array(repeating: 99999, count: 52), count: onboard.count)
    //dp[시][온도] = 최소 소요전력
    dp[0][temperature] = 0
    
    for i in 1..<dp.count {
        for j in 0..<dp[i].count - 1 {
            // 범위 밖일 땐 고려X
            if onboard[i] == 1, (t1 > j || t2 < j) {
                continue
            }
            
//          1. dp[i - 1][j - 1] 에서 1도를 증가시킨 경우
//          2. dp[i - 1][j + 1] 에서 1도를 감소시킨 경우
//          3. dp[i - 1][j] 에서 온도를 유지한 경우
            if j > temperature { // 실내온도 > 실외온도 -> 높일 때 소모
                if j - 1 >= 0 {
                    dp[i][j] = min(dp[i][j], dp[i - 1][j - 1] + a)
                }
                dp[i][j] = min(dp[i][j], dp[i - 1][j + 1])
                dp[i][j] = min(dp[i][j], dp[i - 1][j] + b)
            } else if j < temperature { // 실내온도 < 실외온도 -> 낮출 때 소모
                if j - 1 >= 0 {
                    dp[i][j] = min(dp[i][j], dp[i - 1][j - 1])
                }
                dp[i][j] = min(dp[i][j], dp[i - 1][j + 1] + a)
                dp[i][j] = min(dp[i][j], dp[i - 1][j] + b)
            } else { // 실내온도 == 실외온도 -> 3경우 모두 에어컨 off 하면 되므로 전력 소모 X
                if j - 1 >= 0 {
                    dp[i][j] = min(dp[i][j], dp[i - 1][j - 1])
                }
                dp[i][j] = min(dp[i][j], dp[i - 1][j + 1])
                dp[i][j] = min(dp[i][j], dp[i - 1][j])
            }
        }
    }
    
    return dp[onboard.count - 1].min()!
}
