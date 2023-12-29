//
//  말이 되고픈 원숭이.swift
//  Algorithm
//  bfs
//  Created by 전소영 on 2023/12/28.
//

import Foundation
//1
//4 4
//0 0 0 0
//1 0 0 0
//0 0 1 0
//0 1 0 0
// -> 4
func solution1600() {
    let k = Int(readLine()!)!
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let w = wh[0], h = wh[1]
    var graph: [[Int]] = []
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    let hdx = [-2, -1, 2, 1, -1, 2, -2, 1]
    let hdy = [-1, -2, 1, 2, 2, -1, 1, -2]
    var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 31), count: w), count: h) // count
    
    for _ in 0..<h {
        graph.append((readLine()!.split(separator: " ").map { Int($0)! }))
    }
    
    func bfs() -> Int {
        var queue = [(0, 0, k)] // x, y, k
        visited[0][0][k] = 0
        var index = 0
        
        while queue.count > index {
            let q = queue[index]
            index += 1
            let x = q.0
            let y = q.1
            let k = q.2
        
            if x == h - 1, y == w - 1 {
                return visited[x][y][k]
            }
            
            if k > 0 {
                for i in 0..<8 {
                    let hnx = x + hdx[i]
                    let hny = y + hdy[i]
                    
                    if 0..<h ~= hnx, 0..<w ~= hny, visited[hnx][hny][k - 1] == 0, graph[hnx][hny] == 0 {
                        visited[hnx][hny][k - 1] = visited[x][y][k] + 1
                        queue.append((hnx, hny, k - 1))
                    }
                }
            }
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0..<h ~= nx, 0..<w ~= ny, visited[nx][ny][k] == 0, graph[nx][ny] == 0 {
                    visited[nx][ny][k] = visited[x][y][k] + 1
                    queue.append((nx, ny, k))
                }
            }
        }
        
        return -1
    }
    
    print(bfs())
}
