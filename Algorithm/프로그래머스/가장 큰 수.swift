//
//  가장 큰 수.swift
//  Algorithm
//  - 정렬
//  Created by 전소영 on 2021/11/19.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    let sortedNumbers = numbers.sorted { Int("\($0)\($1)") ?? 0 > Int("\($1)\($0)") ?? 0 }
    
    if sortedNumbers[0] == 0 {
        return "0"
    }
    
    return sortedNumbers.reduce("") { $0 + "\($1)" }
}

