//
//  피보나치 수 3.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/19.
//

import Foundation

func solution2749() {
    let n = Int(readLine()!)!
    let mod = 1000000
    var fibonacci = [0, 1]
    let p = mod / 10 * 15
    
    for i in 2...p {
        fibonacci.append(fibonacci[i - 2] + fibonacci[i - 1])
        fibonacci[i] %= mod
    }
    
    print(fibonacci[n % p])
}
