//
//  요격 시스템.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/09.
//

import Foundation

// targets                                             result
// [[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]    3
func solution181188(_ targets: [[Int]]) -> Int {
    var targets = targets.sorted(by: { $0[1] < $1[1] })
    var answer = 1

    var end = targets[0][1]
    for i in 1..<targets.count {
        if end <= targets[i][0] {
            end = targets[i][1]
            answer += 1
        }
    }
    
    return answer
}
