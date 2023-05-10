//
//  부대복귀.swift
//  Algorithm
//
//  Created by 전소영 on 2023/05/10.
//

import Foundation
// n    roads                                       sources         destination       result
// 3    [[1, 2], [2, 3]]                            [2, 3]          1                 [1, 2]
// 5    [[1, 2], [1, 4], [2, 4], [2, 5], [4, 5]]    [1, 3, 5]       5                 [2, -1, 0]
func solution132266(_ n: Int, _ roads: [[Int]], _ sources: [Int], _ destination: Int) -> [Int] {
    var visited = Array(repeating: -1, count: n + 1)
    var graph = Array(repeating: [Int](), count: n + 1)
    var answer: [Int] = []
    
    for road in roads {
        graph[road[0]].append(road[1])
        graph[road[1]].append(road[0])
    }
    
    var queue = [destination]
    visited[destination] = 0
    
    while !queue.isEmpty {
        let q = queue.removeFirst()
        
        for node in graph[q] {
            if visited[node] == -1 {
                visited[node] = visited[q] + 1
                queue.append(node)
            }
        }
    }
    
    for source in sources {
        answer.append(visited[source])
    }
    
    return answer
}
