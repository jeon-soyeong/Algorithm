//
//  숫자 카드 나누기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/06.
//

import Foundation
//arrayA           arrayB              result
//[10, 17]         [5, 20]               0
//[10, 20]         [5, 17]               10
//[14, 35, 119]    [18, 30, 102]         7
func solution135807(_ arrayA: [Int], _ arrayB: [Int]) -> Int {
    func gcd(_ a: Int, _ b: Int) -> Int {
        let remain = a % b
        return 0 == remain ? min(a, b) : gcd(b, remain)
    }
    
    var answer = 0
    var gcdAValue = arrayA[0]
    var gcdBValue = arrayB[0]
    var maxA = 0
    var maxB = 0
    
    for i in 1..<arrayA.count {
        gcdAValue = gcd(gcdAValue, arrayA[i])
        gcdBValue = gcd(gcdBValue, arrayB[i])
    }
    
    if gcdAValue != 1, arrayB.allSatisfy({ $0 % gcdAValue != 0 }) {
        maxA = gcdAValue
    }
    
    if gcdBValue != 1, arrayA.allSatisfy({ $0 % gcdBValue != 0 }) {
        maxB = gcdBValue
    }

    answer = max(maxA, maxB)

    return answer
}
