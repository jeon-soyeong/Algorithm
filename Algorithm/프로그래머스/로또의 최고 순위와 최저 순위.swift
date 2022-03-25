//
//  로또의 최고 순위와 최저 순위.swift
//  Algorithm
//
//  Created by 전소영 on 2022/03/25.
//

import Foundation

func lotto(_ lottos: [Int], _ win_nums: [Int]) -> [Int] {
    var minWinCount = 0
    var maxWinCount = 0
    
    for lotto in lottos {
        if win_nums.contains(lotto) {
            minWinCount += 1
            maxWinCount += 1
        }
        
        if lotto == 0 {
            maxWinCount += 1
        }
    }

    return [getRank(winCount: maxWinCount), getRank(winCount: minWinCount)]
}

func getRank(winCount: Int) -> Int {
    switch winCount {
    case 0, 1:
        return 6
    case 2:
        return 5
    case 3:
        return 4
    case 4:
        return 3
    case 5:
        return 2
    case 6:
        return 1
    default:
        return 0
    }
}
