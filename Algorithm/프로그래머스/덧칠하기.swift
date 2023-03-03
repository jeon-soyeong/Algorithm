//
//  덧칠하기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/03.
//

import Foundation
//n    m    section         result
//8    4    [2, 3, 6]       2
//5    4    [1, 3]          1
//4    1    [1, 2, 3, 4]    4
func solution161989(_ n: Int, _ m: Int, _ section: [Int]) -> Int {
    var sections = section
    var answer = 0

    while !sections.isEmpty {
        let start = sections.removeFirst()
        while !sections.isEmpty, start + m > sections.first! {
            sections.removeFirst()
        }
        answer += 1
    }

    return answer
}
