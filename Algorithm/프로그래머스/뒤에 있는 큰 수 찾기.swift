//
//  뒤에 있는 큰 수 찾기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/02/27.
//

import Foundation
//numbers               result
//[2, 3, 3, 5]          [3, 5, 5, -1]
//[9, 1, 5, 3, 6, 2]    [-1, 5, 6, 6, -1, -1]
func solution154539(_ numbers: [Int]) -> [Int] {
    var result = numbers
    var stack: [Int] = []
    
    for i in 0..<numbers.count {
        while !stack.isEmpty, result[stack.last!] < result[i] {
            result[stack.removeLast()] = result[i]
        }
        stack.append(i)
    }
    
    for i in stack {
        result[i] = -1
    }
    
    return result
}
