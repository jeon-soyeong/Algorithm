//
//  연속된 부분 수열의 합.swift
//  Algorithm
//  - 투포인터
//  Created by 전소영 on 2023/06/29.
//

import Foundation
//sequence                  k    result
//[1, 2, 3, 4, 5]           7    [2, 3]
//[1, 1, 1, 2, 3, 4, 5]     5    [6, 6]
//[2, 2, 2, 2, 2]           6    [0, 2]
func solution178870(_ sequence: [Int], _ k: Int) -> [Int] {
    var sum = sequence[0]
    var left = 0
    var right = 0
    var answer: [[Int]] = []
    
    while left < sequence.count, right < sequence.count {
        if sum == k {
            answer.append([left, right])
        }
        
        if sum <= k {
            right += 1
            if right == sequence.count {
                break
            }
            sum += sequence[right]
        } else {
            sum -= sequence[left]
            left += 1
        }
    }
    
    answer = answer.sorted(by: {
        if $0[1] - $0[0] == $1[1] - $1[0] {
            return $0[0] < $1[0]
        } else {
            return $0[1] - $0[0] < $1[1] - $1[0]
            
        }
    })
    
    return answer.isEmpty ? [] : answer[0]
}
