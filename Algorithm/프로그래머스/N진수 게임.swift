//
//  N진수 게임.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/07.
//

import Foundation

func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    var answer = ""
    var turnCounter = 1
    var integer = 0
    
    while answer.count < t {
        let convertedStringByBaseN = String(integer, radix: n, uppercase: true)
        
        for number in convertedStringByBaseN {
            if turnCounter == p {
                answer += String(number)
            }
            
            if turnCounter == m {
                turnCounter = 0
            }
            
            if answer.count == t {
                break
            }
            
            turnCounter += 1
        }
        
        integer += 1
    }
    
    return answer
}
