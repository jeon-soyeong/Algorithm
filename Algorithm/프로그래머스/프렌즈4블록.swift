//
//  프렌즈4블록.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/03.
//

import Foundation

func solution(_ m: Int, _ n: Int, _ board: [String]) -> Int {
    var boards: [[String]] = []
    for b in board { boards.append(b.map { String($0) }) }
    var count: Int = 0
    
    while true {
        var flag: Bool = false
        var flagBoards: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if i != 0, j != 0 {
                    if(boards[i][j] != " " && boards[i][j] == boards[i-1][j-1] && boards[i][j] == boards[i-1][j] && boards[i][j] == boards[i][j-1]) {
                        flag = true
                        flagBoards[i][j] = true
                        flagBoards[i-1][j-1] = true
                        flagBoards[i-1][j] = true
                        flagBoards[i][j-1] = true
                    }
                }
            }
        }
        
        if !flag {
            break
        }
 
        for i in 0..<m {
            for j in 0..<n {
                if flagBoards[i][j] {
                    count += 1
                    for k in stride(from: i, through: 1, by: -1) {
                        boards[k][j] = boards[k - 1][j]
                        boards[k - 1][j] = " "
                    }
                }
            }
        }
    }
    
    return count
}
