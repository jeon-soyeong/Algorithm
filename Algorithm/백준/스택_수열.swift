//
//  스택_수열.swift
//  Algorithm
//  - 자료구조, 스택
//  Created by 전소영 on 2021/03/17.
//

import Foundation

func stack() {
    let n = Int(readLine()!)!
    var stack: [Int] = []
    var count = 1
    var plusMinus = ""
    
    for _ in 1...n {
        let inputNumber = Int(readLine()!)!
        
        while count <= inputNumber {
            stack.append(count)
            print(stack)
            count += 1
            print("count: \(count)")
            plusMinus += "+\n"
        }
        
        if stack.last != inputNumber {
            plusMinus = "NO"
            break
        }
        
        stack.removeLast()
        plusMinus += "-\n"
    }
    print(plusMinus)
}
