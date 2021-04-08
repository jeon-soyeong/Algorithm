//
//  큰 수 만들기.swift
//  Algorithm
//  - 그리디
//  Created by 전소영 on 2021/04/08.
//

import Foundation

func solution(_ number: String, _ k: Int) -> String {
    let numberArray = number.map{ String($0) }
    var count = 0
    var stack: [String] = []
    
    for i in 0..<numberArray.count {
        while count < k && !stack.isEmpty && stack.last! < numberArray[i] {
            stack.removeLast()
            count += 1
        }
        
        if k <= count {
            stack.append(contentsOf: numberArray[i...])
            break
        } else {
            stack.append(numberArray[i])
        }
    }
    
    return String(stack.joined().prefix(number.count - k))
}
