//
//  n + 1 카드게임.swift
//  Algorithm
//
//  Created by 전소영 on 2024/02/16.
//

import Foundation
//coin   cards                                      result
//4      [3, 6, 7, 2, 1, 10, 5, 9, 8, 12, 11, 4]    5
//3      [1, 2, 3, 4, 5, 8, 6, 7, 9, 10, 11, 12]    2
//2      [5, 8, 1, 2, 9, 4, 12, 11, 3, 10, 6, 7]    4
//10     [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]    1
func solution258707(_ coin: Int, _ cards: [Int]) -> Int {
    var handCard = cards.prefix(cards.count / 3).map { Int($0) }
    let target = cards.count + 1
    var cards = cards[cards.count / 3..<cards.count].map { Int($0) }
    var keepCard: [Int] = []
    var coin = coin
    var answer = 1
    
    loop: while !cards.isEmpty {
        for _ in 0..<2 {
            let c = cards.removeFirst()
            keepCard.append(c)
        }
        
        if handCard.isEmpty && coin <= 1 {
            break
        }
        
        // handCard에서 2장 낼 수 있을 때
        for i in 0..<handCard.count - 1 {
            for j in i + 1..<handCard.count {
                if handCard[i] + handCard[j] == target {
                    answer += 1
                    handCard = handCard.filter { $0 != handCard[i] && $0 != handCard[j] }
                    continue loop
                }
            }
        }
        
        //handCard에서 1장, keepCard에서 1장 낼 수 있을 때
        if 1 <= coin {
            for i in 0..<handCard.count {
                for j in 0..<keepCard.count {
                    if handCard[i] + keepCard[j] == target {
                        answer += 1
                        coin -= 1
                        handCard = handCard.filter { $0 != handCard[i] }
                        keepCard = keepCard.filter { $0 != keepCard[j] }
                        continue loop
                    }
                }
            }
        }
        
        //keepCard에서 2장 낼 수 있을 때
        if 2 <= coin {
            for i in 0..<keepCard.count {
                for j in 0..<keepCard.count {
                    if keepCard[i] + keepCard[j] == target {
                        answer += 1
                        coin -= 2
                        keepCard = keepCard.filter { $0 != keepCard[i] && $0 != keepCard[j] }
                        continue loop
                    }
                }
            }
        }
        // 3가지 경우 모두 해당 X 게임 종료
        break
    }
    
    return answer
}
