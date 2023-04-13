//
//  숨바꼭질 3.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/13.
//

import Foundation
// 5 17     2
func solution13549() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0]
    let k = input[1]
    var visited = Array(repeating: false, count: 100001)
    var queue = [(x: n, time: 0)]
    visited[n] = true

    while !queue.isEmpty {
        let node = queue.removeFirst()
        if node.x == k {
            print(node.time)
            break
        }
        
        if node.x * 2 < 100001, !visited[node.x * 2] {
            visited[node.x * 2] = true
            queue.insert((x: node.x * 2, time: node.time), at: 0)
        }
        
        if node.x + 1 < 100001, !visited[node.x + 1] {
            visited[node.x + 1] = true
            queue.append((x: node.x + 1, time: node.time + 1))
        }
        
        if node.x - 1 > -1, !visited[node.x - 1] {
            visited[node.x - 1] = true
            queue.append((x: node.x - 1, time: node.time + 1))
        }
    }
}
