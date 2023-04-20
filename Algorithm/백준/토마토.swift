//
//  토마토.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/20.
//

import Foundation
//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1
func solution7576() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = input[0]
    let n = input[1]
    
    var graph: [[Int]] = []
    var depth = Array(repeating: Array(repeating: 0, count: m), count: n)
    var queue: [(Int, Int)] = []
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var index = 0
    var isRipe = true
    var lastIndex: (Int, Int) = (0, 0)
    
    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 1 {
                queue.append((i, j))
            }
        }
    }
    
    func bfs() {
        while index < queue.count {
            let (x, y) = queue[index]
            index += 1
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0..<n ~= nx, 0..<m ~= ny, graph[nx][ny] == 0 {
                    graph[nx][ny] = 1
                    queue.append((nx, ny))
                    depth[nx][ny] = depth[x][y] + 1
                    lastIndex = (nx, ny)
                }
            }
        }
    }
    
    bfs()
    
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 0 {
                isRipe = false
            }
        }
    }
    
    isRipe ? print(depth[lastIndex.0][lastIndex.1]) : print(-1)
}
