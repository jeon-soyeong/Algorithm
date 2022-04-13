//
//  삼각 달팽이.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/13.
//

import Foundation

func snail(_ n: Int) -> [Int] {
    var answerArray: [[Int]] = Array(repeating: [Int](), count: n)
    var startRow = 0
    var endRow = 1
    var floorRow = n - 1
    var endNumber = 0
    var x = 1
    var repeatingCount = 0
    
    for i in 1...answerArray.count {
        answerArray[i - 1] = Array(repeating: 0, count: i)
    }
    
    for i in 1...n {
        endNumber += i
    }
    
    while true {
        //밑으로 내려갈 때
        for i in startRow...floorRow {
            answerArray[i][repeatingCount] = x
            if endNumber != x {
                x += 1
            } else {
                return makeSnailArray(arrays: answerArray)
            }
        }
        //옆으로
        for i in repeatingCount + 1...floorRow - repeatingCount {
            answerArray[floorRow][i] = x
            if endNumber != x {
                x += 1
            } else {
                return makeSnailArray(arrays: answerArray)
            }
        }
        //위로 올라갈 때
        for i in stride(from: floorRow - 1, to: endRow - 1, by: -1) {
            answerArray[i][i - repeatingCount] = x
            if endNumber != x {
                x += 1
            } else {
                return makeSnailArray(arrays: answerArray)
            }
        }
        startRow += 2
        endRow += 2
        floorRow -= 1
        repeatingCount += 1
    }
    
    return makeSnailArray(arrays: answerArray)
}

func makeSnailArray(arrays: [[Int]]) -> [Int] {
    var answerArray: [Int] = []
    for array in arrays {
        answerArray.append(contentsOf: array)
    }
    
    return answerArray
}
