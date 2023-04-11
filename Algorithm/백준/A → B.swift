//
//  A → B.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/11.
//

import Foundation
//2 162     5    2 → 4 → 8 → 81 → 162
//4 42     -1
func solution16953() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var start = input[0]
    var end = input[1]
    var answer = 1
    
    while start < end {
        if end % 2 == 0 {
            end /= 2
        } else if end % 10 == 1 {
            end /= 10
        } else {
            break
        }
        
        answer += 1
    }
    start == end ? print(answer) : print(-1)
}
