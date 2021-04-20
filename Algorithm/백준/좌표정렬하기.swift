//
//  좌표정렬하기.swift
//  Algorithm
//  - 정렬
//  Created by 전소영 on 2021/04/20.
//

import Foundation

func coordinateSorting() {
    let count = Int(readLine()!)!
    var array: [(x: Int, y: Int)] = []
    
    for i in 0..<count {
        let input = readLine()!.split(separator: " ")
        array.append((Int(input[0])!, Int(input[1])!))
    }
    
    array.sort { (first, second) -> Bool in
        if first.x == second.x {
            return first.y < second.y
        }
        return first.x < second.x
    }
    
    for element in array {
        print(element.x, terminator: " ")
        print(element.y)
    }
}
