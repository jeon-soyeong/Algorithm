//
//  소형기관차.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/18.
//

import Foundation
//7
//35 40 50 10 30 45 60
//2
//-> 240
func solution2616() {
    let n = Int(readLine()!)!
    let people = readLine()!.split(separator: " ").map { Int($0)! }
    let maxTrainCount = Int(readLine()!)!
    // dp[i][j] 소형기관차 i대를 운행할 때 j번째 객차를 선택했을 경우 최대 운송 손님 수
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: 4)
    var sum = [0]
    var temp = 0
    
    for p in people {
        temp += p
        sum.append(temp)
    }
    
    for i in 1..<4 {
        for j in i * maxTrainCount...n {
            if i == 1 {
                dp[i][j] = max(dp[i][j - 1], sum[j] - sum[j - maxTrainCount])
            } else {
                dp[i][j] = max(dp[i][j - 1], dp[i - 1][j - maxTrainCount] + sum[j] - sum[j - maxTrainCount])
            }
        }
    }
    
    print(dp[3][n])
}
