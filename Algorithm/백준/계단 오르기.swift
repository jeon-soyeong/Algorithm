//
//  계단 오르기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/12.
//

//6
//10
//20
//15
//25
//10
//20
import Foundation

func solution2579() {
    let n = Int(readLine()!)!
    var array: [Int] = []
    var dp = Array(repeating: 0, count: n)
    
    for _ in 0..<n {
        array.append(Int(readLine()!)!)
    }
    
    if n == 1 {
        print(array[0])
    } else if n == 2 {
        print(array[0] + array[1])
    } else if n == 3 {
        print(max(array[0] + array[2], array[1] + array[2]))
    } else {
        dp[0] = array[0]
        dp[1] = array[0] + array[1]
        dp[2] = max(array[0] + array[2], array[1] + array[2])
        
        for i in 3..<array.count {
            dp[i] = max(dp[i - 2] + array[i], dp[i - 3] + array[i - 1] + array[i])
        }
        
        print(dp[n - 1])
    }
}
