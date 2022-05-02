//
//  내적.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/02.
//

import Foundation

func solution(_ a: [Int], _ b: [Int]) -> Int {
    var answer = 0
    
    for i in 0..<a.count {
        answer += a[i] * b[i]
    }
    
    return answer
}
