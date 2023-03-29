//
//  기지국 설치.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/29.
//

import Foundation

// N    stations    W    answer
// 11    [4, 11]        1    3
// 16    [9]            2    3
func solution12979(_ n: Int, _ stations: [Int], _ w: Int) -> Int{
    var answer = 0
    var start = 1
    
    for station in stations {
        answer += Int(ceil((Double(station - w - start) / Double(2 * w + 1))))
        start = station + w + 1
    }

    if n >= start {
        answer += Int(ceil((Double(n - start + 1) / Double(2 * w + 1))))
    }

    return answer
}
