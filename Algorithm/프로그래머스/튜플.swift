//
//  튜플.swift
//  Algorithm
//
//  Created by 전소영 on 2021/12/13.
//

import Foundation

func solution(_ s: String) -> [Int] {
    let ss = s.replacingOccurrences(of: "{", with: "")
    let sss = ss.replacingOccurrences(of: "}", with: "")
    let sssArray = sss.components(separatedBy: ",")
    var dictionary: [String: Int] = [:]
    
    for element in sssArray {
        if dictionary[element] == nil {
            dictionary[element] = 1
        } else {
            dictionary[element]! += 1
        }
    }
    
    let sortedDictionary = dictionary.sorted { $0.1 > $1.1 }
    let answer = sortedDictionary.map { Int($0.key)! }
    
    return answer
}
