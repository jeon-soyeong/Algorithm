//
//  극장 좌석.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/05.
//

import Foundation
//9
//2
//4
//7
func solution2302() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 41)
    var answer = 1
    var vips: [Int] = []
   
    dp[0] = 1
    dp[1] = 1
    dp[2] = 2

    for i in 3...40 {
        dp[i] = dp[i - 1] + dp[i - 2]
    }

    for _ in 0..<m {
        vips.append(Int(readLine()!)!)
    }
    
    var prevSeat = 0

    for vip in vips {
        answer *= dp[vip - prevSeat - 1]
        prevSeat = vip
    }

    answer *= dp[n - prevSeat]

    print(answer)
}
