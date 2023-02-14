//
//  조이스틱.swift
//  Algorithm
//  - 그리디
//  Created by 전소영 on 2021/04/01.
//

import Foundation

func solution42860(_ name: String) -> Int {
    let name = Array(name)
    var upDownCount = 0
    var leftRightCount = name.count - 1
    
    for startIndex in 0..<name.count {
        let up = name[startIndex].asciiValue! - 65
        let down = 90 - name[startIndex].asciiValue! + 1
        upDownCount += Int(min(up, down))
        
        var endIndex = startIndex + 1
        while endIndex < name.count, name[endIndex] == "A" {
            endIndex += 1
        }
        
        let moveFront = startIndex * 2 + name.count - endIndex
        let moveBack = (name.count - endIndex) * 2 + startIndex
        
        leftRightCount = min(leftRightCount, moveFront)
        leftRightCount = min(leftRightCount, moveBack)
    }
    
    return upDownCount + leftRightCount
}
