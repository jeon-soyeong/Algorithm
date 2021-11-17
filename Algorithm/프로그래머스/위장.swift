//
//  위장.swift
//  Algorithm
//  - 해시
//  Created by 전소영 on 2021/11/17.
//

import Foundation

func solution(_ clothes: [[String]]) -> Int {
    var dictionary: [String: [String]] = [:]
    
    for c in clothes {
        if dictionary[c[1]] != nil {
            dictionary[c[1]]!.append(c[0])
        } else {
            dictionary[c[1]] = [c[0]]
        }
    }
    
    let count = dictionary.mapValues { $0.count }.values
    
    return count.reduce(1) { $0 * ($1 + 1) } - 1
}
