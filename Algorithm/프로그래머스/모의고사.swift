//
//  모의고사.swift
//  Algorithm
//  - 완전탐색
//  Created by 전소영 on 2021/11/23.
//

import Foundation

func solution(_ answers: [Int]) -> [Int] {
    let giveUpOne = [1, 2, 3, 4, 5]
    let giveUpTwo =  [2, 1, 2, 3, 2, 4, 2, 5]
    let giveUpThree = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

    var score: [Int: Int] = [:]

    for i in 0..<answers.count {
        if answers[i] == giveUpOne[i % giveUpOne.count] {
            score[1] = (score[1] ?? 0) + 1
        }
        if answers[i] == giveUpTwo[i % giveUpTwo.count] {
            score[2] = (score[2] ?? 0) + 1
        }
        if answers[i] == giveUpThree[i % giveUpThree.count] {
            score[3] = (score[3] ?? 0) + 1
        }
    }

    return score.filter { $0.value == score.values.max() }.keys.sorted()
}
