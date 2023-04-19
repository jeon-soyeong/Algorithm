//
//  아기 상어 2.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/19.
//

import Foundation

//5 4
//0 0 1 0
//0 0 0 0
//1 0 0 0
//0 0 0 0
//0 0 0 1

//[3, 2, 1, 2],
//[2, 2, 2, 2],
//[1, 2, 3, 3],
//[2, 2, 2, 2],
//[3, 3, 2, 1]]
func solution17086() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0]
    let m = input[1]
    
    var graph: [[Int]] = []
    var queue: [(Int,Int)] = []
    var answer = 0

    let dx = [-1, 1, 0, 0, -1, 1, -1, 1]
    let dy = [0, 0, -1, 1, -1, -1, 1, 1]
    
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
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        
        for i in 0..<dx.count {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0..<n ~= nx, 0..<m ~= ny, graph[nx][ny] == 0 {
                graph[nx][ny] = graph[x][y] + 1
                queue.append((nx, ny))
                answer = max(answer, graph[nx][ny])
            }
        }
    }
    
    print(answer - 1)
}
