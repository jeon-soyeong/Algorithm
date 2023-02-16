//
//  같은 숫자는 싫어.swift
//  Algorithm
//
//  Created by 전소영 on 2023/02/15.
//

import Foundation
//arr                answer
//[1,1,3,3,0,1,1]    [1,3,0,1]
//[4,4,4,3,3]        [4,3]
func solution12906(_ arr: [Int]) -> [Int] {
    var answer: [Int] = []
    
    for a in arr {
        if !answer.isEmpty, answer.last != a {
            answer.append(a)
        } else if answer.isEmpty {
            answer.append(a)
        }
    }
    
    return answer
}
