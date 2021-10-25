//
//  단어 변환.swift
//  Algorithm
//  - DFS, BFS
//  Created by 전소영 on 2021/10/22.
//

import Foundation

func getNeighbor(_ words: [String]) -> [[Int]] {
    let n = words.count
    var neighbors = Array(repeating: [Int](), count: n)
    
    for i in 0..<n {
        for j in i + 1..<n {
            var count = 0
            zip(words[i], words[j]).forEach { (c1, c2) in
                if c1 != c2 {
                    count += 1
                }
            }
            
            if count == 1 {
                neighbors[i].append(j)
                neighbors[j].append(i)
            }
        }
    }
    
    return neighbors
}

func findShortestPath(_ neighbors: [[Int]], _ words: [String], _ target: String) -> Int {
    let n = neighbors.count
    var queue = [Int]()
    var depth = Array(repeating: 0, count: n)
    var visited = Array(repeating: false, count: n)
    
    queue.append(0)
    visited[0] = true
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        if words[current] == target {
            return depth[current]
        }
        
        for next in neighbors[current] {
            if visited[next] == false {
                visited[next] = true
                depth[next] = depth[current] + 1
                queue.append(next)
            }
        }
    }
    
    return 0
}

func changeWords(_ begin: String, _ target: String, _ words: [String]) -> Int {
    guard words.contains(target) else {
        return 0
    }
    
    var words = words
    words.insert(begin, at: 0)
    
    let neighbors = getNeighbor(words)
    
    return findShortestPath(neighbors, words, target)
}
