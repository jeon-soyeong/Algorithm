//
//  데스노트.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/09.
//

import Foundation
//11 20
//7
//4
//2
//3
//2
//5
//1
//12
//7
//5
//6
//
//61
func solution2281() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var array: [Int] = []
    var dp = Array(repeating: 0, count: n + 1)
    
    for _ in 0..<n {
        array.append(Int(readLine()!)!)
    }
    
    for i in stride(from: n - 2, through: 0, by: -1) {
        var j = i + 1
        var remain = m - array[i]
        var temp = remain * remain + dp[i + 1]
        
        while j < n, remain - 1 >= array[j] {
            if j == n - 1 {
                temp = 0
                break
            }
            
            remain -= array[j] + 1
            temp = min(temp, remain * remain + dp[j + 1])
            j += 1
        }
        
        dp[i] = temp
    }
    
    print(dp[0])
}
