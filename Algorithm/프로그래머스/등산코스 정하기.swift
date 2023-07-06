//
//  등산코스 정하기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/05.
//

import Foundation

// n    paths    gates    summits    result
// 6    [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]]    [1, 3]    [5]    [5, 3]
// 7    [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]]    [1]    [2, 3, 4]    [3, 4]
// 7    [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]]    [3, 7]    [1, 5]    [5, 1]
// 5    [[1, 3, 10], [1, 4, 20], [2, 3, 4], [2, 4, 6], [3, 5, 20], [4, 5, 6]]    [1, 2]    [5]    [5, 6]
func solution118669(_ n: Int, _ paths: [[Int]], _ gates: [Int], _ summits: [Int]) -> [Int] {
    var answer: [(Int, Int)] = []
    var visited = Array(repeating: Int.max, count: n + 1)
    var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
    
    for path in paths {
        graph[path[0]].append((path[1], path[2]))
        graph[path[1]].append((path[0], path[2]))
    }

    for gate in gates {
        visited[gate] = 0
    }
    
    for summit in summits {
        visited[summit] = -1
    }
    
    for gate in gates {
        var queue = [gate]
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for node in graph[current] {
                let intensity = max(visited[current], node.1)
                
                if visited[node.0] == -1 {
                    answer.append((node.0, intensity))
                    continue
                }
                                  
                if visited[node.0] > intensity {
                    visited[node.0] = intensity
                    queue.append(node.0)
                }
            }
        }
    }
    answer.sort(by: { $0.0 < $1.0 })
    answer.sort(by: { $0.1 < $1.1 })
    
    return [answer.first!.0, answer.first!.1]
}
