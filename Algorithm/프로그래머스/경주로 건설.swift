//
//  경주로 건설.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/19.
//

import Foundation

func solution(_ board: [[Int]]) -> Int {
    let N = board.count
    let direction = [[-1, 0, 1, 0], [0, 1, 0, -1]]  // 좌,  우,  하,  상
    var costBoard = [[Int]](repeating: [Int](repeating: Int.max, count: N), count: N)
    
    func isInside(_ r: Int, _ c: Int) -> Bool {
        if r < 0 || r >= N || c < 0 || c >= N {
            return false
        }
        return true
    }
    
    func dfs(_ current: (r: Int, c: Int, cost: Int, direction: Int)) {
        if board[current.r][current.c] == 1 || current.cost > costBoard[current.r][current.c] {
            return
        }
        
        costBoard[current.r][current.c] = current.cost
        
        for index in 0..<4 {
            let nr = current.r + direction[0][index]
            let nc = current.c + direction[1][index]
            
            if isInside(nr, nc) {
                if current.direction == index {
                    dfs((r: nr, c: nc, cost: current.cost + 100, index))
                } else {
                    dfs((r: nr, c: nc, cost: current.cost + 600, index))
                }
            }
        }
    }
    
    costBoard[0][0] = 0
    
    dfs((r: 0, c: 1, cost: 100, direction: 1))
    dfs((r: 1, c: 0, cost: 100, direction: 2))
    
    return costBoard[N - 1][N - 1]
}
