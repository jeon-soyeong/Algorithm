//
//  피보나치 수.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/13.
//

import Foundation

func solution12945(_ n: Int) -> Int {
    var answer = [0, 1]
    
    for i in 2...n {
        answer.append((answer[i - 1] + answer[i - 2]) % 1234567)
    }
    
    return answer[n]
}


