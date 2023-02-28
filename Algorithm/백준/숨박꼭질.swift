//
//  숨박꼭질.swift
//  Algorithm
//  - BFS
//  Created by 전소영 on 2023/02/28.
//

import Foundation
//5 17 -> 4
func solution1697() {
    let readLine = readLine()!.split(separator: " ").map { Int($0)! }
    let max = 100001
    var queue: [Int] = [readLine.first!]
    var visited = Array(repeating: false, count: max)
    var depth = Array(repeating: -1, count: max)
    var index = 0
    depth[readLine.first!] = 0
    
    while queue.count > index {
        let node = queue[index]
        index += 1
        
        if node == readLine.last! {
            print(depth[node])
            break
        }
        
        if node + 1 < max, !visited[node + 1] {
            queue.append(node+1)
            depth[node + 1] = depth[node] + 1
            visited[node + 1] = true
        }
        
        if 0 <= node - 1, !visited[node - 1] {
            queue.append(node-1)
            depth[node - 1] = depth[node] + 1
            visited[node - 1] = true
        }
        
        if node * 2 < max, !visited[node * 2 ] {
            visited[node * 2] = true
            queue.append(node*2)
            depth[node * 2] = depth[node] + 1
        }
    }
}
