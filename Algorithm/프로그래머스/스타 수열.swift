//
//  스타 수열.swift
//  Algorithm
//
//  Created by 전소영 on 2023/06/30.
//

import Foundation
// a                      result
// [0]                    0
// [5,2,3,3,5,3]          4
// [0,3,3,0,7,2,0,2,2,0]  8
func solution70130(_ a: [Int]) -> Int {
    var answer = 0
    var countDictionary: [Int: Int] = [:]
    
    if a.count == 1 {
        return 0
    }
    
    a.forEach {
        countDictionary[$0, default: 0] += 1
    }

    for (key, value) in countDictionary {
        if value <= answer {
            continue
        }
        
        var count = 0
        var index = 0
        while index < a.count - 1 {
            if (a[index] == key || a[index + 1] == key), a[index] != a[index + 1] {
                count += 1
                index += 2
            } else {
                index += 1
            }
        }
        
        answer = max(answer, count)
    }
    
    return 2 * answer
}
