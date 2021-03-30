//
//  블랙잭.swift
//  Algorithm
//  - 브루트포스 알고리즘
//  Created by 전소영 on 2021/03/16.
//

import Foundation

func playBlackZackGame() -> Int {
    let cardArray = readLine()!.split(separator: " ").map{ Int($0)! }
    let cardCount = cardArray[0]
    let targetCardValue = cardArray[1]
    let cards = readLine()!.split(separator: " ").map{ Int($0)! }
    var result = 0
    
    for i in 0..<cardCount - 2 {
        for j in i+1..<cardCount - 1 {
            for k in j+1..<cardCount {
                let totalCardValue = cards[i] + cards[j] + cards[k]

                if totalCardValue == targetCardValue {
                    result = totalCardValue
                    break
                }
                else if targetCardValue > totalCardValue && totalCardValue > result {
                    result = totalCardValue
                }
            }
        }
    }
    print(result)
    return result
}
