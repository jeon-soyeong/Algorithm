//
//  가장 큰 정사각형 찾기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/10.
//

import Foundation

func solution12905(_ board: [[Int]]) -> Int {
    var checking = board
    var max = 0
    
    for i in 1..<board.count {
        for j in 1..<board[i].count {
            if board[i][j] == 1 {
                checking[i][j] = min(checking[i-1][j-1], checking[i-1][j], checking[i][j-1]) + 1
                max = max < checking[i][j] ? checking[i][j] : max
            }
        }
    }
    
    if board.count == 1 || board[0].count == 1 {
        max = 1
    }
    
    return max * max
}
