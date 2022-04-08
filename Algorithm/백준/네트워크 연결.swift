//
//  네트워크 연결.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/08.
//

import Foundation

func connectNetwork() {
    let computerCount = Int(readLine()!)!
    let lineCount = Int(readLine()!)!
    
    typealias Edge = (a: Int, b: Int, cost: Int)
    var lineArray = [Edge]()
    var parentArray: [Int] = []
    
    for i in 0...computerCount {
        parentArray.append(i)
    }
    
    for _ in 0..<lineCount {
        let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
        lineArray.append(Edge((edge[0], edge[1], edge[2])))
    }
    
    func find(_ index: Int) -> Int {
        if parentArray[index] == index {
            return index
        }
        parentArray[index] = find(parentArray[index])
        return parentArray[index]
    }
    
    func union(_ a: Int, _ b: Int) {
        let aParent = find(a)
        let bParent = find(b)
        
        if aParent < bParent {
            parentArray[bParent] = aParent
        } else {
            parentArray[aParent] = bParent
        }
    }
    
    lineArray.sort(by: { $0.cost < $1.cost })
    var connectLineCount = 0
    var totalCost = 0
    
    for (a, b, cost) in lineArray {
        if connectLineCount >= computerCount {
            break
        }

        if find(a) != find(b) {
            union(a, b)
            connectLineCount += 1
            totalCost += cost
        }
    }
    
    print(totalCost)
}
