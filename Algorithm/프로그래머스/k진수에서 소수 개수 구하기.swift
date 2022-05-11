//
//  k진수에서 소수 개수 구하기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/11.
//

import Foundation

func solution92335(_ n: Int, _ k: Int) -> Int {
    let string = String(n, radix: k).split(separator: "0")
    return string.filter { checkPrimeNumber(Int($0)!) }.count
}

func checkPrimeNumber(_ n: Int) -> Bool {
    if n == 1  { return false }
    if n == 2 || n == 3 { return true }
    let sq = Int(sqrt(Double(n)))
    
    for i in 2...sq {
        if n % i == 0 {
            return false
        }
    }

    return true
}
