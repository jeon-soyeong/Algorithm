//
//  N으로 표현.swift
//  Algorithm
//  - 동적계획법 (Dynamic Programming)
//  Created by 전소영 on 2021/11/10.
//

import Foundation

func solution(_ N: Int, _ number: Int) -> Int {
        if N == number {
            return 1
        }
    
        var numbers = [Set<Int>](repeating: Set(), count: 9)
        var number = N
    
        for i in 1..<9 {
            numbers[i].insert(number)
            number = number * 10 + N
        }
    
        for i in 1..<9 {
            for j in 1..<i {
                for operation1 in numbers[j] {
                    for operation2 in numbers[i - j] {
                        numbers[i].insert(operation1 + operation2)
                        numbers[i].insert(operation1 - operation2)
                        numbers[i].insert(operation1 * operation2)
                        if operation2 != 0 {
                            numbers[i].insert(operation1 / operation2)
                        }
                    }
                }
            }
    
            if numbers[i].contains(number) {
                return i
            }
        }
        return -1
}
