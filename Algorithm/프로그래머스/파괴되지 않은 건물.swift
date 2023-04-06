//
//  파괴되지 않은 건물.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/06.
//

import Foundation
// board                                skill                                           result
//                                      1 공격, 2 회복 0,0 부터 3,4 까지 -4
// [[5,5,5,5,5],                        [[1,0,0,3,4,4],                                 10
// [5,5,5,5,5],                         [1,2,0,2,3,2],
// [5,5,5,5,5],                         [2,1,0,3,1,2],
// [5,5,5,5,5]]                         [1,0,1,3,3,1]]

// [[1,2,3],[4,5,6],[7,8,9]],           [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]]   6
func solution92344(_ board: [[Int]], _ skill: [[Int]]) -> Int {
    var answer = 0
    var bArray = Array(repeating: Array(repeating: 0, count: board[0].count + 1), count: board.count + 1)
    
    for s in skill {
        let x1 = s[1]
        let y1 = s[2]
        let x2 = s[3]
        let y2 = s[4]
        let degree = s[0] == 1 ? -s[5] : s[5]
        
        bArray[x1][y1] += degree
        bArray[x1][y2 + 1] -= degree
        bArray[x2 + 1][y1] -= degree
        bArray[x2 + 1][y2 + 1] += degree
    }
    
    for i in 1..<bArray.count {
        for j in 0..<bArray[i].count {
            bArray[i][j] += bArray[i - 1][j]
        }
    }
    
    for i in 0..<bArray.count {
        for j in 1..<bArray[i].count {
            bArray[i][j] += bArray[i][j - 1]
        }
    }
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            bArray[i][j] += board[i][j]
            if bArray[i][j] > 0 {
                answer += 1
            }
        }
    }
    
    return answer
}
