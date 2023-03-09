//
//  마법의 엘리베이터.swift
//  Algorithm
//
//  Created by 전소영 on 2023/03/09.
//

import Foundation
//storey    result
//16        6
//2554      16
func solution148653(_ storey: Int) -> Int {
    var storey = storey
    var answer = 0
    
    while storey != 0 {
        let s = storey % 10
        
        if s > 5 {
            answer += 10 - s
            storey += 10 - s
        } else if s == 5, (storey / 10) % 10 >= 5 {
            answer += 10 - s
            storey += 10 - s
        } else {
            answer += s
        }
        storey = storey / 10
    }
    
    return answer
}
