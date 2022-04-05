//
//  예상 대진표.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/05.
//

import Foundation

func solution(_ n: Int, _ a: Int, _ b: Int) -> Int {
    var answer = 0
    var a = a
    var b = b
    
    while a != b {
        a = a % 2 == 0 ? a / 2 : (a + 1) / 2
        b = b % 2 == 0 ? b / 2 : (b + 1) / 2
        answer += 1
    }
    
    return answer
}
