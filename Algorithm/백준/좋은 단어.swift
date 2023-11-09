//
//  좋은 단어.swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/09.
//

import Foundation
//3
//ABAB
//AABB
//ABBA
func solution3986() {
    let n = Int(readLine()!)!
    var arrays: [[String]] = []
    var answer = 0
    
    for _ in 0..<n {
        let input = Array(readLine()!).map { String($0) }
        arrays.append(input)
    }
    
    for array in arrays {
        var stack: [String] = []
        
        for a in array {
            if !stack.isEmpty {
                if a == stack.last! {
                    stack.removeLast()
                } else {
                    stack.append(a)
                }
            } else {
                stack.append(a)
            }
        }
        
        if stack.isEmpty {
            answer += 1
        }
    }
    
    print(answer)
}
