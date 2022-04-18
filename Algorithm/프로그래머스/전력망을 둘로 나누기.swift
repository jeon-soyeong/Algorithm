//
//  전력망을 둘로 나누기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/15.
//

import Foundation

//9    [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]
func slice(_ n: Int, _ wires: [[Int]]) -> Int {
    var connectingArray = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
    var minimumCount: Int = Int.max
    
    wires.forEach {
        connectingArray[$0[0]][$0[1]] = true
        connectingArray[$0[1]][$0[0]] = true
    }
    
    wires.forEach {
        var leftCount: Int = 0
        var rightCount: Int = 0
        countConnectingWire(parent: nil, start: $0[0], stop: $0[1], count: &leftCount, connectingArray: connectingArray)
        countConnectingWire(parent: nil, start: $0[1], stop: $0[0] ,count: &rightCount, connectingArray: connectingArray)
        minimumCount = min(minimumCount, abs(leftCount - rightCount))
    }
    
    return minimumCount
}

func countConnectingWire(parent: Int?, start: Int, stop: Int, count: inout Int, connectingArray: [[Bool]]) {
    let filterArray = connectingArray[start].enumerated().filter { $0.element && $0.offset != parent && $0.offset != stop }.map { $0.offset }
    count += filterArray.count
    filterArray.forEach {
        countConnectingWire(parent: start, start: $0, stop: stop, count: &count, connectingArray: connectingArray)
    }
}
