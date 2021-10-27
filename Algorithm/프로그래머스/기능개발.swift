//
//  기능개발.swift
//  Algorithm
//  - 스택/큐
//  Created by 전소영 on 2021/10/27.
//

import Foundation

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var queue: [Int] = []
    var answer: [Int] = []
    var count = 1
    
    for i in 0..<progresses.count {
        let remainingDay = ceil(Double((100 - progresses[i])) / Double(speeds[i]))
        queue.append(Int(remainingDay))
    }
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        count = 1
        
        while !queue.isEmpty, current >= queue[0] {
            count += 1
            queue.removeFirst()
        }
        
        answer.append(count)
    }
    
    return answer
}
