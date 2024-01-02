//
//  탈출.swift
//  Algorithm
//  bfs
//  Created by 전소영 on 2024/01/02.
//

import Foundation
// 3 3
// D.*
// ...
// .S.
// -> 3
func solution3055() {
    let rc = readLine()!.split(separator: " ").map { Int($0)! }
    let r = rc[0]
    let c = rc[1]
    let dx = [-1, 1, 0 , 0]
    let dy = [0, 0, -1, 1]
    var graph: [[String]] = []
    var queue: [(Int, Int)] = []
    var waterQueue: [(Int, Int)] = []
    var visited = Array(repeating: Array(repeating: false, count: c), count: r)
    
    for _ in 0..<r {
        let input = readLine()!.map { String($0) }
        graph.append(input)
    }
    
    for i in 0..<r {
        for j in 0..<c {
            if graph[i][j] == "S" {
                queue.append((i, j))
            } else if graph[i][j] == "*" {
                waterQueue.append((i, j))
            }
        }
    }
    
    func bfs() {
        var time = 0
        
        while !queue.isEmpty {
            time += 1
            // 물 확장
            var waterTemp: [(Int, Int)] = []
            
            while !waterQueue.isEmpty {
                let water = waterQueue.removeFirst()
                let wx = water.0
                let wy = water.1
                
                for i in 0..<4 {
                    let nwx = wx + dx[i]
                    let nwy = wy + dy[i]
                    
                    if 0..<r ~= nwx, 0..<c ~= nwy, graph[nwx][nwy] == "." {
                        graph[nwx][nwy] = "*"
                        waterTemp.append((nwx, nwy))
                    }
                }
            }
            
            waterQueue = waterTemp
            
            // 고슴도치 시작
            var moveTemp: [(Int, Int)] = []
            
            while !queue.isEmpty {
                let q = queue.removeFirst()
                let qx = q.0
                let qy = q.1
                
                for i in 0..<4 {
                    let nqx = qx + dx[i]
                    let nqy = qy + dy[i]
                    
                    if 0..<r ~= nqx, 0..<c ~= nqy, !visited[nqx][nqy] {
                        if graph[nqx][nqy] == "D" {
                            print(time)
                            return
                        } else if graph[nqx][nqy] == "." {
                            visited[nqx][nqy] = true
                            moveTemp.append((nqx, nqy))
                        }
                    }
                }
            }
            
            queue = moveTemp
        }
        print("KAKTUS")
    }
    
    bfs()
}
