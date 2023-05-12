//
//  인사고과.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/11.
//

import Foundation

//scores                            result
//[[2,2],[1,4],[3,2],[3,2],[2,1]]    4
func solution152995(_ scores: [[Int]]) -> Int {
    var answer = 1
    let wanhoScore = scores[0]
    let wanhoTotalScore = wanhoScore.reduce(0, +)
    let sortedTotalScores = scores.sorted(by: { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0] })
    var threshold = 0

    for score in sortedTotalScores {
        if wanhoScore[0] < score[0], wanhoScore[1] < score[1] {
            return -1
        }
        
        if threshold <= score[1] {
            let totalScore = score[0] + score[1]
            if wanhoTotalScore < totalScore {
                answer += 1
            }
            threshold = score[1]
        }
    }

    return answer
}
