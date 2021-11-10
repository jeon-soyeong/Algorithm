//
//  징검다리.swift
//  Algorithm
//  - 이분탐색
//  Created by 전소영 on 2021/11/09.
//

import Foundation

func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
    let rocks = rocks.sorted()
    var answer = 1
    var start = 1
    var end = distance
    
    while start <= end {
        let mid = (start + end) / 2
        var indicator = 0
        var removeCount = 0
        
        for rock in rocks {
            if rock - indicator < mid {
                removeCount += 1
                if removeCount > n {
                    break
                }
            } else {
                indicator = rock
            }
        }
        
        if distance - indicator < mid {
            removeCount += 1
        }
        
        if removeCount <= n {
            answer = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return answer
}
