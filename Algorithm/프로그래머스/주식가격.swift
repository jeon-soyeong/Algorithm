//
//  주식가격.swift
//  Algorithm
//  - 스택/큐
//  Created by 전소영 on 2021/11/04.
//

import Foundation

func solution(_ prices: [Int]) -> [Int] {
    let size = prices.count
    var answer = [Int](repeating: 0, count: size)
    
    for i in 0..<size {
        for j in i + 1..<size {
            answer[i] += 1
            if prices[i] > prices[j] {
                break
            }
        }
    }
    
    return answer
}
