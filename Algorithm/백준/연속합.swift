//
//  연속합.swift
//  Algorithm
//
//  Created by 전소영 on 2023/06/13.
//

import Foundation
//10
//10 -4 3 1 5 6 -35 12 21 -1
func solution1912() {
    let n = Int(String(readLine()!))!
    let array = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = Array(repeating: -9999, count: 100001)
    dp[0] = array[0]
    
    for i in 1..<n {
        dp[i] = max(dp[i - 1] + array[i], array[i])
    }
    
    print(dp.max()!)
}
