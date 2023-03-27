//
//  숫자 게임.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/27.
//

import Foundation

func solution12987(_ a: [Int], _ b: [Int]) -> Int {
    var answer = 0
    var aArray = a
    var bArray = b
    
    aArray.sort(by: >)
    bArray.sort(by: >)
    
    for _ in bArray {
        if aArray.first! < bArray.first! {
            answer += 1
            bArray.removeFirst()
        }
        aArray.removeFirst()
    }
    
    return answer
}
