//
//  등굣길.swift
//  Algorithm
//  - 동적계획법 (Dynamic Programming)
//  Created by 전소영 on 2021/11/12.
//

import Foundation

func solution(m: Int, n: Int, puddles: [[Int]]) -> Int {
    var matrix: [[Int]] = Array(repeating: Array(repeating: -1, count: m), count: n)
 
    for x in 0..<m {
        for y in 0..<n {
           for puddle in puddles {
                matrix[puddle[0] - 1][puddle[1] - 1] = 0
                continue
            }
            
            if x == 0, y == 0 {
                matrix[y][x] = 1
                continue
            }
            
            if y == 0 {
                matrix[y][x] = matrix[y][x-1]
                continue
            }
            
            if x == 0 {
                matrix[y][x] = matrix[y-1][x]
                continue
            }
            
            matrix[y][x] = matrix[y][x-1] + matrix[y-1][x]
        }
    }
    
    return matrix[n - 1][m - 1] % 1000000007
}
