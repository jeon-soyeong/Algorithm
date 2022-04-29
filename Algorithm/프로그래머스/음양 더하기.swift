//
//  음양 더하기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/29.
//

import Foundation

func solution76501(_ absolutes: [Int], _ signs: [Bool]) -> Int {
    var answer = 0
    for i in 0..<signs.count {
        if signs[i] {
            answer += absolutes[i]
        } else {
            answer -= absolutes[i]
        }
    }
    
    return answer
}
