//
//  실패율.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/06.
//

import Foundation

func solution42889(_ N: Int, _ stages: [Int]) -> [Int] {
    var currentCount = Double(stages.count)
    var beforeAnswer: [(Double, Int)] = []
    var answer: [Int] = []
    
    for i in 1...N {
        var count: Double = 0
        for j in 0..<stages.count {
            if i == stages[j] {
                count += 1
            }
        }
        beforeAnswer.append((-count / currentCount, i))
        currentCount -= count
    }
    
    beforeAnswer = beforeAnswer.sorted(by: { $0 < $1 })
    answer = beforeAnswer.map { $0.1 }
    
    return answer
}
