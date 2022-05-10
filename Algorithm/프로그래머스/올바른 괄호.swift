//
//  올바른 괄호.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/11.
//

import Foundation

func solution12909(_ s: String) -> Bool {
    let sArray = Array(s)
    let bracket = ("(", ")")
    var openBracketCount = 0
    var closedBracketCount = 0
    var answer = false
    
    for i in 0..<sArray.count {
        if i == 0, String(sArray[0]) == bracket.1 {
            answer = false
            return answer
        } else if i == sArray.count, String(sArray[0]) == bracket.0 {
            answer = false
            return answer
        } else {
            if String(sArray[i]) == bracket.0 {
                openBracketCount += 1
            } else {
                closedBracketCount += 1
            }
        }
        if openBracketCount < closedBracketCount {
            answer = false
            return answer
        }
    }
    
    if openBracketCount == closedBracketCount {
        answer = true
    } else {
        answer = false
    }

    return answer
}
