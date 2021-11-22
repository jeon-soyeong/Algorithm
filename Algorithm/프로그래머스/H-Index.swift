//
//  H-Index.swift
//  Algorithm
//  - 정렬
//  Created by 전소영 on 2021/11/19.
//

import Foundation

func solution(_ citations: [Int]) -> Int {
    let sortedCitations = citations.sorted(by: >)
    
    for i in 0..<sortedCitations.count {
        if i >= sortedCitations[i] {
            return i
        }
    }
    
    return sortedCitations.count
}
