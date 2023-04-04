//
//  풍선 터트리기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/04.
//

import Foundation

func solution68646(_ a: [Int]) -> Int {
    var answer = 0
    let n = a.count
    var leftMin = Array(repeating: 0, count: n)
    var rightMin = Array(repeating: 0, count: n)
    
    leftMin[0] = a[0]
    for i in 1..<n {
        leftMin[i] = min(leftMin[i - 1], a[i])
    }
    
    rightMin[n - 1] = a[n - 1]
    for i in stride(from: n - 2, through: 0, by: -1) {
        rightMin[i] = min(rightMin[i + 1], a[i])
    }
    
    for i in 0..<n {
        if a[i] > leftMin[i], a[i] > rightMin[i] {
            answer += 1
        }
    }
    
    return n - answer
}
// -1 2 1 -> 큰수 가운데로 양쪽 작은수 배치되면, 2는 항상 살아 남을 수 없음
// https://small-stap.tistory.com/71
