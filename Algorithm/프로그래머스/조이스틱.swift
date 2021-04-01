//
//  조이스틱.swift
//  Algorithm
//  - 그리디
//  Created by 전소영 on 2021/04/01.
//

import Foundation

func solution(_ name:String) -> Int {
    var upDownMinimumMoveCount = 0
    let name = name.map{ $0 }
    for i in 0..<name.count {
        if name[i] != "A" {
            let up = name[i].asciiValue! - 65
            let down = 90 - name[i].asciiValue!
            upDownMinimumMoveCount += Int(min(up, down))
        }
    }
    
    var leftRightMinimumMoveCount = name.count-1
    for i in 0..<name.count {
        if name[i] != "A" {
            var next = i + 1
            while next<name.count && name[next] == "A" {
                next += 1
            }
            let move = 2 *  i + name.count - next
            leftRightMinimumMoveCount = min(move, leftRightMinimumMoveCount)
        }
    }
    return upDownMinimumMoveCount + leftRightMinimumMoveCount
}
