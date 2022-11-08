//
//  멀리 뛰기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/11/08.
//

import Foundation

func solution12914(_ n: Int) -> Int {
    var answer = [1, 2]
    var i = 0

    while answer.count < n {
        answer.append((answer[i] + answer[i + 1]) % 1234567)
        i += 1
    }

    return answer[n - 1]
}
