//
//  가장 긴 팰린드롬.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/3.
//

import Foundation

func solution12904(_ s: String) -> Int {
    let sArray = s.map { String($0) }
    let n = sArray.count

    for length in stride(from: n, through: 1, by: -1) {
        for start in 0...n - length {
            let end = start + length - 1
            var isPalindrome = true

            for i in 0..<length / 2 {
                if sArray[start + i] != sArray[end - i] {
                    isPalindrome = false
                    break
                }
            }

            if isPalindrome {
                return length
            }
        }
    }

    return 1
}
