//
//  n^2 배열 자르기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/22.
//

import Foundation

func solution87390(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    var answerArray: [Int] = []
    
    for i in Int(left)...Int(right) {
        answerArray.append(max(i / n, i % n) + 1)
    }
    
    return answerArray
    
//    return (Int(left)...Int(right)).map { max($0 / n, $0 % n) + 1 }
}

//1 2 3 4  (0,0) (0,1) (0,2) (0,3)
//2 2 3 4  (1,0) (1,1) (1,2) (1,3)
//3 3 3 4  (2,0) (2,1) (2,2) (2,3)
//4 4 4 4  (3,0) (3,1) (3,2) (3,3)

//1 2 3 4  2 2 3 4  3 3 3 4  4 4 4 4
