//
//  N개의 최소공배수.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/13.
//

import Foundation
//arr           result
//[2,6,8,14]    168
//[1,2,3]       6
func solution12953(_ arr: [Int]) -> Int {
    return arr.reduce(1) { getLeastCommonMultiple($0, $1) }
}

//최대공약수(GCD)
func getGreatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
    let remain = a % b
    return 0 == remain ? min(a, b) : getGreatestCommonDivisor(b, remain)
}

//최소공배수(LCM)
func getLeastCommonMultiple(_ m: Int, _ n: Int) -> Int {
    return m * n / getGreatestCommonDivisor(m, n)
}
