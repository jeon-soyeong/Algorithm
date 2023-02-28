//
//  숫자 변환하기.swift
//  Algorithm
//  - BFS
//  Created by 전소영 on 2023/02/28.
//

import Foundation
//x    y     n    result
//10   40    5    2
//10   40    30   1
//2    5     4    -1
func solution154538(_ x: Int, _ y: Int, _ n: Int) -> Int {
    var queue = [x]
    let max = 1000001
    var visited = Array(repeating: false, count: max)
    var depth = Array(repeating: -1, count: max)
    var index = 0
    depth[x] = 0
    
    while queue.count > index {
        let node = queue[index]
        index += 1
        
        if node == y {
            return depth[node]
        }
        
        if node + n < max, !visited[node + n] {
            visited[node + n] = true
            queue.append(node + n)
            depth[node + n] = depth[node] + 1
        }
        
        if node * 2 < max, !visited[node * 2] {
            visited[node * 2] = true
            queue.append(node * 2)
            depth[node * 2] = depth[node] + 1
        }
        
        if node * 3 < max, !visited[node * 3] {
            visited[node * 3] = true
            queue.append(node * 3)
            depth[node * 3] = depth[node] + 1
        }
    }
    
    return -1
}
