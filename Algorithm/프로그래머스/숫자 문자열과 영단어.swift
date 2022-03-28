//
//  숫자 문자열과 영단어.swift
//  Algorithm
//
//  Created by 전소영 on 2022/03/28.
//

import Foundation

func solution(_ s: String) -> Int {
    var string = s
    
    if string.contains("zero") {
        string = string.replacingOccurrences(of: "zero", with: "0")
    }
    
    if string.contains("one") {
        string = string.replacingOccurrences(of: "one", with: "1")
    }
    
    if string.contains("two") {
        string = string.replacingOccurrences(of: "two", with: "2")
    }
    
    if string.contains("three") {
        string = string.replacingOccurrences(of: "three", with: "3")
    }
    
    if string.contains("four") {
        string = string.replacingOccurrences(of: "four", with: "4")
    }
    
    if string.contains("five") {
        string = string.replacingOccurrences(of: "five", with: "5")
    }
    
    if string.contains("six") {
        string = string.replacingOccurrences(of: "six", with: "6")
    }
    
    if string.contains("seven") {
        string = string.replacingOccurrences(of: "seven", with: "7")
    }
    
    if string.contains("eight") {
        string = string.replacingOccurrences(of: "eight", with: "8")
    }
    
    if string.contains("nine") {
        string = string.replacingOccurrences(of: "nine", with: "9")
    }
 
    return Int(string)!
}
