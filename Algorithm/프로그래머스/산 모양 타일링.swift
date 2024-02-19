//
//  산 모양 타일링.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/02/19.
//

import Foundation

func solution(_ n: Int, _ tops: [Int]) -> Int {
    var a = Array(repeating: 0, count: n + 1)
    var b = Array(repeating: 0, count: n + 1)
    b[0] = 1
    
    for i in 1...n {
        a[i] = (a[i - 1] + b[i - 1]) % 10007
        
        if tops[i - 1] == 1 {
            b[i] = (a[i - 1] * 2 + b[i - 1] * 3) % 10007
        } else {
            b[i] = (a[i - 1] + b[i - 1] * 2) % 10007
        }
    }
    
    return (a[n] + b[n]) % 10007
}
