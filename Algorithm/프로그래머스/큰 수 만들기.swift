//
//  큰 수 만들기.swift
//  Algorithm
//  - 그리디
//  Created by 전소영 on 2021/04/08.
//

import Foundation
//number         k    return
//"1924"         2    "94"
//"1231234"      3    "3234"
//"4177252841"   4    "775841"

func solution42883(_ number: String, _ k: Int) -> String {
    let numbers = number.map { Int(String($0))! }
    var stack: [Int] = []
    var count = 0
    
    for number in numbers {
        while !stack.isEmpty, stack.last! < number, count < k {
            stack.popLast()
            count += 1
        }
        stack.append(number)
        
        while stack.count > numbers.count - k {
            stack.popLast()
        }
    }
    
    return stack.map { String($0) }.joined()
}
