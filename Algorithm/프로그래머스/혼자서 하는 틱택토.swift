//
//  혼자서 하는 틱택토.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/23.
//

import Foundation
// "O.X",  -> 가능
// ".O.",
// "..X"

// "OOO", -> 다섯번째 선공 O에서 멈춰졌어야함 -> 불가능
// "...",
// "XXX"

// "...",  -> 선공일 때는 O 먼저 -> 불가능
// ".X.",
// "..."

// "...", -> 가능
// "...",
// "..."
func solution160585(_ board: [String]) -> Int {
    var oCount = 0
    var xCount = 0
    let board = board.map { Array($0) }
    let points = [[(0, 0), (0, 1), (0, 2)], [(1, 0), (1, 1), (1, 2)], [(2, 0), (2, 1), (2, 2)], [(0, 0), (1, 0), (2, 0)], [(0, 1), (1, 1), (2, 1)], [(0, 2), (1, 2), (2, 2)], [(0, 0), (1, 1), (2, 2)], [(0, 2), (1, 1), (2, 0)]] // 가로, 세로, 대각선

    for i in 0..<3 {
        for j in 0..<3 {
            if board[i][j] == "O" {
                oCount += 1
            } else if board[i][j] == "X" {
                xCount += 1
            }
        }
    }
    
    let isOWinner = !points.filter { point in point.allSatisfy { board[$0.0][$0.1] == "O" } }.isEmpty
    let isXWinner = !points.filter { point in point.allSatisfy { board[$0.0][$0.1] == "X" } }.isEmpty
    
    if xCount > oCount || oCount > xCount + 1  { return 0 }
    if isOWinner, oCount <= xCount { return 0 }
    if isXWinner, xCount < oCount { return 0 }

    return 1
}
