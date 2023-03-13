//
//  혼자 놀기의 달인.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/13.
//

import Foundation

func solution131130(_ cards: [Int]) -> Int {
    var visited = Array(repeating: false, count: cards.count)
    var scores: [Int] = []
    
    for i in 0..<cards.count {
        var score = 0
        var index = i
        
        while !visited[index] {
            visited[index] = true
            let card = cards[index]
            index = card - 1
            score += 1
        }
        scores.append(score)
    }
    
    scores = scores.sorted(by: >)
    
    return scores[0] * scores[1]
}
