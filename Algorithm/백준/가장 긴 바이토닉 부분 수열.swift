//
//  가장 긴 바이토닉 부분 수열.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/26.
//

import Foundation
//10
//1 5 2 1 4 3 4 5 2 1
//7
//모든 원소들의 증가하는 부분수열의 크기 + 감소하는 부분수열의 크기 - 1 을 한 값 중 최댓값
func solution11054() {
    let n = Int(readLine()!)!
    var array = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: 1, count: n)
    var rdp = Array(repeating: 1, count: n)

    for i in 0..<array.count {
        for j in 0..<i {
            if array[i] > array[j] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }

    array = array.reversed()
    
    for i in 0..<array.count {
        for j in 0..<i {
            if array[i] > array[j] {
                rdp[i] = max(rdp[i], rdp[j] + 1)
            }
        }
    }
    
    for i in 0..<n {
        dp[i] = dp[i] + rdp[n - 1 - i] - 1
    }

    print(dp.max()!)
}
