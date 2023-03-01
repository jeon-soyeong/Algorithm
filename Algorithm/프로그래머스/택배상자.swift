//
//  택배상자.swift
//  Algorithm
//
//  Created by 전소영 on 2023/02/28.
//

import Foundation
//order              result
//[4, 3, 1, 2, 5]    2
//[5, 4, 3, 2, 1]    5
func solution131704(_ order: [Int]) -> Int {
    var tempArray: [Int] = []
    var count = 0
    var index = 0
    
    for i in 1...order.count {
        if order[index] != i {
            tempArray.append(i)
            continue
        }
        
        index += 1
        count += 1
        
        while !tempArray.isEmpty, order[index] == tempArray.last! {
            tempArray.removeLast()
            index += 1
            count += 1
        }
    }
    
    return count
}
