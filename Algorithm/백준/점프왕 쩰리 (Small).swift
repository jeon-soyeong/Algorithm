//
//  점프왕 쩰리 (Small).swift
//  Algorithm
//  dfs
//  Created by 전소영 on 2024/01/09.
//

import Foundation
//3
//1 1 10
//1 5 1
//2 2 -1
//HaruHaru

//3
//2 2 1
//2 2 2
//1 2 -1
//Hing
func solution16173() {
    let n = Int(readLine()!)!
    var graph: [[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graph.append(input)
    }
    
    func dfs(_ x: Int, _ y: Int) {
        visited[x][y] = true

        let dx = [graph[x][y], 0]
        let dy = [0, graph[x][y]]
        
        for i in 0..<2 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0..<n ~= nx, 0..<n ~= ny, !visited[nx][ny] {
                dfs(nx, ny)
            }
        }
    }
    
    dfs(0, 0)

    print(visited[n - 1][n - 1] ? "HaruHaru" : "Hing")
}
