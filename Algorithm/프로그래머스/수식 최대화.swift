//
//  수식 최대화.swift
//  Algorithm
//
//  Created by 전소영 on 2021/12/10.
//

import Foundation

func solution(_ expression: String) -> Int64 {
    var expressionResult: [String] = []
    var temp = ""

    for charactor in expression {
        if charactor == "*" || charactor == "+" || charactor == "-" {
            expressionResult.append(temp)
            temp = ""
            expressionResult.append(String(charactor))
        } else {
            temp += String(charactor)
        }
    }
    expressionResult.append(temp)
    
    return max(calculate(expressionResult, operations: ["*", "+", "-"]), calculate(expressionResult, operations: ["*", "-", "+"]),
        calculate(expressionResult, operations: ["+", "*", "-"]), calculate(expressionResult, operations: ["+", "-", "*"]),
        calculate(expressionResult, operations: ["-", "+", "*"]), calculate(expressionResult, operations: ["-", "*", "+"]))
}

func calculate(_ expression: [String], operations: [String]) -> Int64 {
    var expression = expression
    
    for operation in operations {
        while expression.contains(operation) {
            guard let index = expression.firstIndex(of: operation) else {
                return 0
            }
            let nextIndexValue = expression.remove(at: index + 1)
            
            switch operation {
            case "+":
                expression[index - 1] = String(Int(expression[index - 1])! + Int(nextIndexValue)!)
            case "-":
                expression[index - 1] = String(Int(expression[index - 1])! - Int(nextIndexValue)!)
            default:
                expression[index - 1] = String(Int(expression[index - 1])! * Int(nextIndexValue)!)
            }
            expression.remove(at: index)
        }
    }
    
    return abs(Int64(expression.first!)!)
}
