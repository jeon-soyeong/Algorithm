//
//  수 고르기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/14.
//

import Foundation
// 3 3
// 1
// 5
// 3
// -> 4
func solution2230() {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    var arrays: [Int] = []
    var answer = 987654321
    
    for _ in 0..<n {
        let input = Int(readLine()!)!
        arrays.append(input)
    }
    
    arrays.sort()
    var startIndex = 0
    var endIndex = 1
    
    while startIndex < n, endIndex < n {
        let temp = abs(arrays[startIndex] - arrays[endIndex])
        if temp == m {
            answer = m
            break
        }
        
        if temp < m {
            endIndex += 1
            continue
        }
        
        startIndex += 1
        answer = min(answer, temp)
        
    }
    
    print(answer)
}
