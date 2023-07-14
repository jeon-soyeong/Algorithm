//
//  퇴사 2.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/13.
//

import Foundation
//7
//3 10
//5 20
//1 10
//1 20
//2 15
//4 40
//2 200

//      1일    2일    3일    4일    5일    6일   7일
//Ti     3     5      1     1      2     4     2
//Pi    10    20     10    20     15    40   200

func solution15486() {
    let n = Int(readLine()!)!
    var t = Array(repeating: 0, count: n + 1)
    var p = Array(repeating: 0, count: n + 1)
    var dp = Array(repeating: 0, count: n + 2)

    for i in 1...n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        t[i] = input[0]
        p[i] = input[1]
        dp[i] = p[i]
    }

    for i in stride(from: n, through: 1, by: -1) { // 역순
        if t[i] + i <= n + 1 {
            dp[i] = max(dp[i + 1], dp[i + t[i]] + p[i])
        } else {
            dp[i] = dp[i + 1]
        }
    }

    print(dp.max()!)
}
