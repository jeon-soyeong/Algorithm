//
//  가장 긴 감소하는 부분 수열.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/13.
//

import Foundation
//6
//10 30 10 20 20 10
func solution11722() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 1, count: n)
    let array = readLine()!.split(separator: " ").map { Int(String($0))! }

    for i in 0..<n {
        for j in 0..<i {
            if array[i] < array[j] { // 앞이 더 크면
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    
    print(dp.max()!)
}
