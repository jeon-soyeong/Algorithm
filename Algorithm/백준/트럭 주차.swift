//
//  트럭 주차.swift
//  Algorithm
//
//  Created by 전소영 on 2023/11/09.
//

import Foundation
//5 3 1
//1 6
//3 5
//2 8
func solution2979() {
    let cost = readLine()!.split(separator: " ").map { Int(String($0))! }
    var trucks: [(Int, Int)] = []
    
    for _ in 0..<3 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        trucks.append((input[0], input[1]))
    }
    
    trucks.sort(by: { $0.1 < $1.1 })
    let last = trucks.last!.1
    
    var check = Array(repeating: 0, count: last + 1)
    
    for truck in trucks {
        let start = truck.0
        let end = truck.1
        
        for i in start..<end {
            check[i] += 1
        }
    }
    
    let sum = check.filter { $0 != 0 }.map { $0 * cost[$0 - 1] }.reduce(0, +)
    
    print(sum)
}
