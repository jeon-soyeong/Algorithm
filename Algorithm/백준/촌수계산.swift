//
//  촌수계산.swift
//  Algorithm
//
//  Created by 전소영 on 2023/12/15.
//

import Foundation
//9
//7 3
//7
//1 2
//1 3
//2 7
//2 8
//2 9
//4 5
//4 6
func solution2644() {
    let n = Int(readLine()!)!
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = nodes[0], child = nodes[1]
    let m = Int(readLine()!)!
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    func bfs(_ parent: Int) {
        var queue = [(parent, 0)]
        visited[parent] = true
        
        while !queue.isEmpty {
            let q = queue.removeFirst()
            let node = q.0
            let depth = q.1
            
            if node == child {
                print(depth)
                return
            }
            
            for g in graph[node] {
                if !visited[g] {
                    visited[g] = true
                    queue.append((g, depth + 1))
                }
            }
        }
        print(-1)
        return
    }
    
    bfs(parent)
}
