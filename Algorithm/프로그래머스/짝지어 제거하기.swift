//
//  짝지어 제거하기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/01.
//

import Foundation

func solution(_ s: String) -> Int {
    var array = Array(s)
    var result: [Character] = []
    
    for i in 0..<array.count {
        if !result.isEmpty && result.last == array[i] {
            result.removeLast()
        } else {
            result.append(array[i])
        }
    }
    
    return result.isEmpty ? 1 : 0
}
