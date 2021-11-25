//
//  소수찾기.swift
//  Algorithm
//  - 완전탐색
//  Created by 전소영 on 2021/11/23.
//

import Foundation

var results: Set<Int> = []

func findDecimal(_ numbers: String) -> Int {
    let numberArray = Array(numbers)
    
    for i in 1...numberArray.count {
        permutation(count: 0, list: numberArray, value: "", totalCount: i)
    }
    
    return results.count
}

func permutation(count: Int, list: [String.Element], value: String, totalCount: Int) {
    if count == totalCount {
        findPrimeNumber(value)
        return
    } else {
        for i in 0..<list.count {
            var removedArray = list
            let k = removedArray.remove(at: i)
            permutation(count: count + 1, list: removedArray, value: "\(value)\(k)", totalCount: totalCount)
        }
    }
}

func findPrimeNumber(_ value: String) {
    let number = Int(value)!
    var count = 0
    
    if number > 1 {
        for i in 2...number {
            if count > 1 {
                break
            }
            if number % i == 0 {
                count += 1
            }
        }
        
        if count == 1 {
            results.insert(number)
        }
    }
}
