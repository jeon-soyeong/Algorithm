//
//  토마토2.swift
//  Algorithm
//  bfs
//  Created by 전소영 on 2024/01/19.
//

import Foundation
//5 3 2
//0 0 0 0 0
//0 0 0 0 0
//0 0 0 0 0
//0 0 0 0 0
//0 0 1 0 0
//0 0 0 0 0
//-> 4
func solution7569() {
    let mnh = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnh[0], n = mnh[1], h = mnh[2] // 5 , 3,  2
    var graph: [[[Int]]] = Array(repeating: [], count: h)
    let dx = [-1, 1, 0, 0, 0, 0]
    let dy = [0, 0, -1, 1, 0, 0]
    let dz = [0, 0, 0, 0, 1, -1]
    var queue: [(Int, Int, Int)] = []
    
    for i in 0..<h {
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            graph[i].append(input)
        }
    }
    
    for i in 0..<h {
        for j in 0..<n {
            for k in 0..<m {
                if graph[i][j][k] == 1 {
                    queue.append((i, j, k))
                }
            }
        }
    }
    
    var index = 0
    func bfs() {
        while index < queue.count {
            let q = queue[index]
            let z = q.0
            let x = q.1
            let y = q.2
                       
            for i in 0..<6 {
                let nz = z + dz[i]
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0..<n ~= nx, 0..<m ~= ny, 0..<h ~= nz, graph[nz][nx][ny] == 0 {
                    graph[nz][nx][ny] = graph[z][x][y] + 1
                    queue.append((nz, nx, ny))
                }
            }
            index += 1
        }
    }
 
    bfs()

    print(graph.flatMap { $0 }.flatMap { $0 }.contains(0) ? -1 : graph.flatMap { $0 }.flatMap { $0 }.max()! - 1)
}
