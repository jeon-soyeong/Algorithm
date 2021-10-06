//
//  이장님 초대.swift
//  Algorithm
//  - 그리디, 정렬
//  Created by 전소영 on 2021/10/06.
//

import Foundation

func inviteMayor() {
    let n = Int(readLine()!)!
    var array: [Int] = []
    
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    
    for i in 0..<n {
        array.append(readline[i])
    }
    
    let sortedArray = array.sorted(by: >)
    var answerArray: [Int] = []
    
    for i in 0..<n {
        answerArray.append((i + sortedArray[i] + 1))
    }
    print(answerArray.max()! + 1)
}
