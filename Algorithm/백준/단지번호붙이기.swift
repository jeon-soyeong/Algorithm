//
//  단지번호붙이기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/18.
//

import Foundation
//7
//0110100
//0110101
//1110101
//0000111
//0100000
//0111110
//0111000

func solution2667() {
    let n = Int(readLine()!)!

    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var graph: [[Int]] = []
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var homes: [Int] = []
    var homeCount = 0
    
    for _ in 0..<n {
        graph.append(readLine()!.map { Int(String($0))! })
    }
    
    for i in 0..<graph.count {
        for j in 0..<graph[i].count {
            if graph[i][j] == 1, !visited[i][j] {
                homeCount = 0
                dfs(x: i, y: j)
                homes.append(homeCount)
            }
        }
    }
    
    func dfs(x: Int, y: Int) {
        visited[x][y] = true
        homeCount += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0..<n ~= nx, 0..<n ~= ny, graph[nx][ny] == 1, !visited[nx][ny] {
                dfs(x: nx, y: ny)
            }
        }
    }
    
    print(homes.count)
    homes.sort()
    for home in homes {
        print(home)
    }
}
