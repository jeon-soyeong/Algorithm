//
//  괄호 회전하기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/05.
//

import Foundation

func bracketSolution(_ s: String) -> Int {
    let stringDictionary = ["{": "}", "[": "]", "(": ")"]
    var string = s
    var stack: [String] = []
    var result = 0

    for _ in string {
        stack = []
        
        if checkRightBracket(stack: &stack, string: string, stringDictionary: stringDictionary) {
            result += 1
        }
        string += String(string.removeFirst())
    }
    
    return result
}

func checkRightBracket(stack: inout [String], string: String, stringDictionary: [String: String]) -> Bool {
    for bracket in string {
        if stringDictionary.keys.contains(String(bracket)) {
            stack.append(String(bracket))
        } else {
            if !stack.isEmpty {
                if stringDictionary[stack.last!] == String(bracket) {
                    stack.removeLast()
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    return stack.isEmpty ? true : false
}
