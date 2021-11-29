//
//  문자열 압축.swift
//  Algorithm
//
//  Created by 전소영 on 2021/11/25.
//

import Foundation

func solution(_ s: String) -> Int {
    var result: Int = s.count
    
    if s.count < 3 {
        return s.count
    }
    
    for length in 1...s.count / 2 {
        let slicedString = sliceString(s, length)
        let compressedString = compressString(slicedString)
        let length = compressedString.count
        if length < result {
            result = length
        }
    }
    
    return result
}

func sliceString(_ str: String, _ length: Int) -> [String] {
    var result: [String] = []
    var temp = ""
    
    for s in str {
        temp += String(s)
        if temp.count >= length {
            result.append(temp)
            temp = ""
        }
    }
    
    if temp != "" {
        result.append(temp)
    }
    
    return result
}

func compressString(_ array: [String]) -> String {
    var result: String = ""
    var temp: String = ""
    var count: Int = 1
    
    for str in array {
        if temp == str {
            count += 1
        } else {
            if temp != "" {
                result += (count > 1) ? "\(count)\(temp)" : "\(temp)"
            }
            temp = str
            count = 1
        }
    }
    
    if temp != "" { result += (count > 1) ? "\(count)\(temp)" : "\(temp)" }
    return result
}
