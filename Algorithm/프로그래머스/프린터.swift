//
//  프린터.swift
//  Algorithm
//  - 스택/큐
//  Created by 전소영 on 2021/10/28.
//

import Foundation

func solution(_ priorities: [Int], _ location: Int) -> Int {
    var prioritiesArray = priorities
    var sortingArray: [Int] = []
    var tempArray: [Int] = []
    
    for i in 1...prioritiesArray.count {
        tempArray.append(i)
    }
    
    let value = tempArray[location]

    while !prioritiesArray.isEmpty {
        if prioritiesArray[0] != prioritiesArray.max() {
            let prioritiesArrayCurrent = prioritiesArray.removeFirst()
            prioritiesArray.append(prioritiesArrayCurrent)
            
            let tempArrayCurrent = tempArray.removeFirst()
            tempArray.append(tempArrayCurrent)
        } else {
            prioritiesArray.removeFirst()
            
            let tempArrayCurrent = tempArray.removeFirst()
            sortingArray.append(tempArrayCurrent)
        }
    }
    
    guard let answerValue = sortingArray.firstIndex(of: value) else {
        return 0
    }
    
    return answerValue + 1
}
