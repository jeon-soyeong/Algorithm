//
//  순위.swift
//  Algorithm
//  - 그래프, 플로이드 와샬
//  Created by 전소영 on 2021/10/14.
//

import Foundation

func solution(_ n: Int, _ results: [[Int]]) -> Int {
    var win: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    results.forEach{ win[$0[0]][$0[1]] = 1 }
    
    checkWinResultByFloydWarshall(win: &win, n: n)
    
    return checkRankingCount(results: results, win: win, n: n)
}

func checkWinResultByFloydWarshall(win: inout [[Int]], n: Int) {
    for i in 1...n {
        for j in 1...n {
            for k in 1...n {
                if  win[i][j] == 1 && win[k][i] == 1 {
                    win[k][j] = 1
                }
            }
        }
    }
}

func checkRankingCount(results: [[Int]], win: [[Int]], n: Int) -> Int {
    var total: Int = 0
    
    for i in 1...n {
        var count: Int = 0
        for j in 1...n {
            if win[i][j] == 1 || win[j][i] == 1 {
                count += 1
            }
        }
        
        if count == n - 1 {
            total += 1
        }
    }
    
    return total
}
