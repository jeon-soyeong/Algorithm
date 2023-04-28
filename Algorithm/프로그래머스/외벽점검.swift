//
//  외벽점검.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/28.
//

import Foundation

// n(외벽길이)   weak(취약위치)        dist(1시간 동안 이동할 수 있는 거리)    result
// 12         [1, 5, 6, 10]       [1, 2, 3, 4]                     2
// 12         [1, 3, 4, 9, 10]    [3, 5, 7]                        1
func solution60062(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
    var weaks: Set<[Int]> = [weak]
    
    for (count, distance) in dist.reversed().enumerated() {
        var remainingWeaksArray: Set<[Int]> = []
        for weak in weaks {
            for start in weak {
                let end = (n + (start - distance)) % n
                let remainingWeaks = start > end ? weak.filter { $0 < end || start + 1...n ~= $0 } : weak.filter { start + 1..<end ~= $0 }
                if remainingWeaks.isEmpty {
                    return count + 1
                }
                remainingWeaksArray.insert(remainingWeaks)
            }
        }
        weaks = remainingWeaksArray
    }
    
    return -1
}
