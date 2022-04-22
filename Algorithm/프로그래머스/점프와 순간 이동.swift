//
//  점프와 순간 이동.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/21.
//

import Foundation

func solution12980(_ n: Int) -> Int {
    var answer: Int = 0
    var n = n
    
    while n > 0 {
        answer += n % 2
        n = n / 2
    }

    return answer
}
