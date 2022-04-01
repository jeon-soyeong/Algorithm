//
//  행렬 테두리 회전하기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/03/31.
//

import Foundation

func solution(_ rows: Int, _ columns: Int, _ queries: [[Int]]) -> [Int] {
    var matrix: [[Int]] = []
    var answer = [Int]()
    
    for r in 0..<rows {
        matrix.append(Array(r * columns + 1...r * columns + columns))
    }
    
    func rotate(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Int {
        var tmp = matrix[r1 - 1][c1 - 1]
        var minValue = tmp
        var (i, j) = (r1 - 1, c1 - 1)
        
        //오른쪽
        for j in c1..<c2 {
            minValue = min(minValue, matrix[i][j])
            (tmp, matrix[i][j]) = (matrix[i][j], tmp)
        }
        j = c2 - 1
        
        //아래
        for i in r1..<r2 {
            minValue = min(minValue, matrix[i][j])
            (tmp, matrix[i][j]) = (matrix[i][j], tmp)
        }
        i = r2 - 1
        
        //왼쪽
        for j in stride(from: c2 - 2, to: c1 - 2, by: -1) {
            minValue = min(minValue, matrix[i][j])
            (tmp, matrix[i][j]) = (matrix[i][j], tmp)
        }
        j = c1 - 1
        
        //위
        for i in stride(from: r2 - 2, to: r1 - 2, by: -1) {
            minValue = min(minValue, matrix[i][j])
            (tmp, matrix[i][j]) = (matrix[i][j], tmp)
        }
        
        return minValue
    }
    
    for matrix in queries {
        answer.append(rotate(matrix[0], matrix[1], matrix[2], matrix[3]))
    }
    
    return answer
}
