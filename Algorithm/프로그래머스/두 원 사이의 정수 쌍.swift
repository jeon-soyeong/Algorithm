//
//  두 원 사이의 정수 쌍.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/08.
//

import Foundation
// 2, 3
func solution181187(_ r1: Int, _ r2: Int) -> Int64 {
    var answer = 0

    for x in 1...r2 {
        let y1 = x > r1 ? 0 : sqrt(Double(r1 * r1 - x * x))
        let y2 = sqrt(Double(r2 * r2 - x * x))

        answer += Int(floor(y2) - ceil(y1)) + 1
    }

    return Int64(answer * 4)
}
