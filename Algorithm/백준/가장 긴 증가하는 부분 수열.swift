//
//  가장 긴 증가하는 부분 수열.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/24.
//

import Foundation
//6
//10 20 10 30 20 50
//4
func solution11053() {
    let n = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: 1, count: n)
    
    for i in 0..<n {
        for j in 0..<i {
            if array[i] > array[j] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    
    print(dp.max()!)
}
