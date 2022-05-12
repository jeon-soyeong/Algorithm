//
//  최솟값 만들기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/12.
//

import Foundation

func solution12941(_ A: [Int], _ B: [Int]) -> Int {
    var answer = 0
    var a = A.sorted(by: <)
    var b = B.sorted(by: >)
    
    for i in 0..<a.count {
        answer += a.removeFirst() * b.removeFirst()
    }
    
    return answer
}
