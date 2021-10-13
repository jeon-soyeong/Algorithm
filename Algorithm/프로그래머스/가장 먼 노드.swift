//
//  가장 먼 노드.swift
//  Algorithm
//  - 그래프, BFS
//  Created by 전소영 on 2021/10/13.
//

import Foundation

var connectedNode: [[Int]] = []
var visited: [Bool] = []
var result: [Set<Int>] = [[1]]

func findTheMostFarNodeCount(_ n: Int, _ edge: [[Int]]) -> Int {
    connectedNode = Array(repeating: [], count: n + 1)
    visited = Array(repeating: false, count: n + 1)
    
    var depth = 1
    visited[1] = true
    
    edge.forEach {
        connectedNode[$0[0]].append($0[1])
        connectedNode[$0[1]].append($0[0])
    }
    
    while result.last?.isEmpty == false {
        result.append([])
        
        for node in result[result.count - 2] {
            bfs(node, depth)
        }
        
        depth += 1
    }
    
    result.removeLast()
    
    return result.last?.count ?? 0
}

func bfs(_ s: Int, _ depth: Int) {
    connectedNode[s].forEach {
        if visited[$0] == false {
            visited[$0] = true
            result[depth].insert($0)
        }
    }
}
