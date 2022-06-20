//
//  자가진단 테스트.swift
//  Algorithm
//
//  Created by 전소영 on 2022/06/20.
//

import Foundation

//arr = [1, 2, 3, 3, 3, 3, 4, 4]에서 3은 4번, 4는 2번씩 나타나므로 [4,2]를 반환합니다.
//arr = [3, 2, 4, 4, 2, 5, 2, 5, 5]이면 2가 3회, 4가 2회, 5가 3회 나타나므로 [3, 2, 3]를 반환합니다.
//[3, 5, 7, 9, 1]에서 중복해서 나타나는 숫자는 없으므로 [-1]을 반환합니다.

func test(arr: [Int]) -> [Int] {
    var arrayDictionary: [Int: Int] = [:]
    var answer: [Int] = []
    
    for i in arr {
        if arrayDictionary[i] == nil {
            arrayDictionary[i] = 1
        } else {
            arrayDictionary[i]! += 1
        }
    }
    
    answer = arrayDictionary.filter { $0.value > 1 }.sorted(by: { $0.key < $1.key }).map( { $0.value })
    
    return answer.isEmpty ? [-1] : answer
}
