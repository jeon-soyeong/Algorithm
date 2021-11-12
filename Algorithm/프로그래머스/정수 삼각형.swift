//
//  정수 삼각형.swift
//  Algorithm
//  - 동적계획법 (Dynamic Programming)
//  Created by 전소영 on 2021/11/11.
//

import Foundation

func solution(triangle: [[Int]]) -> Int {
    var triangleArray = triangle

    for i in 1..<triangle.count {
        for j in 0..<triangle[i].count {
            if j == 0 {
                triangleArray[i][j] += triangleArray[i - 1][j]
            } else if j == i {
                triangleArray[i][j] += triangleArray[i - 1][j - 1]
            } else {
                triangleArray[i][j] += max(triangleArray[i - 1][j - j], triangleArray[i - 1][j])
            }
        }
    }
    
    return triangleArray[triangleArray.endIndex - 1].max()!
}
