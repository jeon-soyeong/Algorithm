//
//  바닥 장식.swift
//  Algorithm
//  dfs
//  Created by 전소영 on 2024/01/09.
//

import Foundation
//7 8
//--------
//|------|
//||----||
//|||--|||
//||----||
//|------|
//--------
func solution1388() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var graph: [[String]] = []
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    let directions = [1, -1]
    var answer = 0
    
    for _ in 0..<n {
        let input = readLine()!.map { String($0) }
        graph.append(input)
    }
    
    func dfs(_ x: Int, _ y: Int) {
        if graph[x][y] == "|" {
            for i in 0..<2 {
                let nx = x + directions[i]
                
                if 0..<n ~= nx, graph[nx][y] == "|", !visited[nx][y] {
                    visited[nx][y] = true
                    dfs(nx, y)
                }
            }
        } else { // |
            for i in 0..<2 {
                let ny = y + directions[i]
                
                if 0..<m ~= ny, graph[x][ny] == "-", !visited[x][ny] {
                    visited[x][ny] = true
                    dfs(x, ny)
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] {
                visited[i][j] = true
                dfs(i, j)
                answer += 1
            }
        }
    }
    
    print(answer)
}
