//
//  이중우선순위큐.swift
//  Algorithm
//  - 힙(Heap)
//  Created by 전소영 on 2021/11/08.
//

import Foundation

func solution(_ operations: [String]) -> [Int] {
    var returnArray: [Int] = []
    let operations = operations.map { $0.components(separatedBy: " ") }
    
    for operation in operations {
        let splitOperation = operation[0]
        let number = Int(operation[1])!
        
        switch splitOperation {
        case "I":
            returnArray.append(number)
        case "D":
            if !returnArray.isEmpty {
                if number == 1 {
                    returnArray.sort(by: >)
                } else {
                    returnArray.sort()
                }
                returnArray.removeFirst() }
        default:
            break
        }
    }

    return returnArray == [] ? [0,0] : [returnArray.max()!,returnArray.min()!]
}
