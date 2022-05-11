//
//  다음 큰 숫자.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/11.
//

import Foundation

func solution12911(_ n: Int) -> Int {
    var answer = n + 1
    let decimalNOneCount = String(n, radix: 2).filter { $0 == "1" }.count

    while true {
        let decimalIOneCount = String(answer, radix: 2).filter { $0 == "1" }.count
        if decimalNOneCount == decimalIOneCount {
            break
        }
        answer += 1
    }

    return answer
    
//    var answer = n + 1
//    while true {
//        if n.nonzeroBitCount == answer.nonzeroBitCount {
//            break
//        }
//        answer += 1
//    }
//
//    return answer
}
