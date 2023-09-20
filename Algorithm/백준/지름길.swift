//
//  지름길.swift
//  Algorithm
//
//  Created by 전소영 on 2023/09/19.
//

import Foundation
//5 150
//0 50 10
//0 50 20
//50 100 10
//100 151 10
//110 140 90

//8 900
//0 10 9
//20 60 45
//80 190 100
//50 70 15
//160 180 14
//140 160 14
//420 901 5
//450 900 0
func solution1446() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0]
    let d = input[1]
    var roads: [[Int]] = []
    var distances = Array(0...d)

    for _ in 0..<n {
        let road = readLine()!.split(separator: " ").map { Int(String($0))! }
        roads.append(road)
    }
    
    for i in 0...d {
        if i > 0 {
            distances[i] = min(distances[i], distances[i - 1] + 1)
        }
        
        for road in roads {
            let (start, end, length) = (road[0], road[1], road[2])
            if i == start, end <= d, length < distances[end] - distances[start] {
                distances[end] = min(distances[end], distances[start] + length)
            }
        }
    }
    
    print(distances.last!)
}
