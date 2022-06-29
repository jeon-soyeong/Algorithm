//
//  이중우선순위큐.swift
//  Algorithm
//  - 힙(Heap)
//  Created by 전소영 on 2021/11/08.
//

import Foundation

func solution(_ operations: [String]) -> [Int] {
    var result: [Int] = []
    var queue: [Int] = []
    
    for i in 0..<operations.count {
        let operation = operations[i].split(separator: " ")
        let operators = operation[0]
        let number = Int(operation[1])!
        
        switch operators {
        case "I":
            queue.append(number)
        case "D":
            if queue.isEmpty == false {
                if number == 1 {
                    queue.sort(by: >)
                } else {
                    queue.sort(by: <)
                }
                queue.removeFirst()
            }
        default:
            break
        }
    }
    
    return [queue.max() ?? 0, queue.min() ?? 0]
}
