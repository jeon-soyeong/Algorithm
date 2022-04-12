//
//  키패드 누르기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/12.
//

import Foundation

func solution(_ numbers: [Int], _ hand: String) -> String {
    let position: [(Int, Int)] = [(3,1),
                                  (0,0), (0,1), (0,2),
                                  (1,0), (1,1), (1,2),
                                  (2,0), (2,1), (2,2),
                                  (3,0), (3,2)
                                 ]
    var left = (3,0)
    var right = (3,2)
    var answer = ""
    
    for number in numbers {
        let target = position[number]
        
        if number == 1 || number == 4 || number == 7 {
            answer += "L"
            left = target
        } else if number == 3 || number == 6 || number == 9 {
            answer += "R"
            right = target
        } else {
            let leftDistance = abs(target.0 - left.0) + abs(target.1 - left.1)
            let rightDistance = abs(target.0 - right.0) + abs(target.1 - right.1)
            
            if leftDistance > rightDistance {
                answer += "R"
                right = target
            } else if leftDistance < rightDistance  {
                answer += "L"
                left = target
            } else {
                if hand == "left" {
                    answer += "L"
                    left = target
                } else {
                    answer += "R"
                    right = target
                }
            }
        }
    }
    
    return answer
}
