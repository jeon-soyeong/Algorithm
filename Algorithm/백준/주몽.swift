//
//  주몽.swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/10.
//

import Foundation
//6
//9
//2 7 4 1 5 3
func solution1940() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var metarials = readLine()!.split(separator: " ").map { Int(String($0))! }
    var answer = 0
    var startIndex = 0
    var endIndex = n - 1
    
    metarials.sort(by: <)
    
    while startIndex < endIndex {
        let start = metarials[startIndex]
        let end = metarials[endIndex]
        
        if start + end == m {
            answer += 1
            startIndex += 1
            endIndex -= 1
        } else if start + end < m {
            startIndex += 1
        } else if start + end > m {
            endIndex -= 1
        }
    }
    
    print(answer)
}
