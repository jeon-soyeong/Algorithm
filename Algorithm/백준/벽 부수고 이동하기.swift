//
//  벽 부수고 이동하기.swift
//  Algorithm
//  bfs
//  Created by 전소영 on 2023/12/27.
//

import Foundation
//6 4
//0100
//1110
//1000
//0000
//0111
//0000
// -> 15
func solution2206() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var graph: [[Int]] = []
    var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n)
    
    for _ in 0..<n {
        graph.append(readLine()!.map { Int(String($0))! })
    }
    
    func bfs() -> Int {
        var queue = [(0, 0, 0)]
        visited[0][0][0] = 1
        var index = 0

        while queue.count > index {
            let q = queue[index]
            index += 1
            let x = q.0, y = q.1, wall = q.2
            
            if x == n - 1, y == m - 1 {
                return visited[x][y][wall]
            }
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0..<n ~= nx, 0..<m ~= ny {
                    // 벽이 아니고, 방문 X (벽을 이미 부쉈을 수도, 아닐 수도 있음)
                    if graph[nx][ny] == 0, visited[nx][ny][wall] == 0 {
                        visited[nx][ny][wall] = visited[x][y][wall] + 1
                        queue.append((nx, ny, wall))
                    } else if graph[nx][ny] == 1, wall == 0 { // 벽이고, 아직 벽을 부수지 X
                        visited[nx][ny][wall + 1] = visited[x][y][wall] + 1
                        queue.append((nx, ny, wall + 1))
                    }
                }
            }
        }
        
        return -1
    }
    
    print(bfs())
}
