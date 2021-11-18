//
//  k번째 수.swift
//  Algorithm
//  - 정렬
//  Created by 전소영 on 2021/11/19.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var tempArray: [Int] = []
    var resultArray: [Int] = []
    
    for command in commands {
        tempArray = []
        for i in command[0]...command[1] {
            tempArray.append(array[i - 1])
        }
        tempArray = tempArray.sorted()
        resultArray.append(tempArray[command[2] - 1])
    }
    
    return resultArray
}
