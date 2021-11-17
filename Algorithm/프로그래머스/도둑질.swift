//
//  도둑질.swift
//  Algorithm
//  - 동적계획법 (Dynamic Programming)
//  Created by 전소영 on 2021/11/13.
//

import Foundation

func steal(money: [Int]) -> Int {
    var answer = 0
    
    if money.count == 3 {
        for i in 0..<money.count {
            if answer < money[i] {
                answer = money[i]
            }
        }
        return answer
    }
    
    var dp1: [Int] = Array(repeating: 0, count: money.count)
    var dp2: [Int] = Array(repeating: 0, count: money.count)
    
    dp1[0] = money[0]
    dp1[1] = max(money[0], money[1])
    
    dp2[0] = 0
    dp2[1] = money[1]
    
    for i in 2..<money.count - 1 {
        dp1[i] = max(dp1[i - 1], dp1[i - 2] + money[i])
        answer = max(answer, dp1[i])
    }
    
    for i in 2..<money.count {
        dp2[i] = max(dp2[i - 1], dp2[i - 2] + money[i])
        answer = max(answer, dp2[i])
    }
    
    return answer
}
