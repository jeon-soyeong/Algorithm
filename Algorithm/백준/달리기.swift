//
//  달리기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/19.
//

import Foundation
//3 4 4   3
//....
//###.
//....
//1 1 3 1
func solution16930() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0]
    let m = input[1]
    let k = input[2]
    
    var graph: [[String]] = []
    var visited = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    for _ in 0..<n {
        graph.append(readLine()!.map { String($0) })
    }
    
    let point = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x1 = point[0] - 1
    let y1 = point[1] - 1
    let x2 = point[2] - 1
    let y2 = point[3] - 1
    
    var queue = [[x1, y1]]
    var index = 0
    visited[x1][y1] = 0
    
    while index < queue.count {
        let q = queue[index]
        let x = q[0]
        let y = q[1]
        index += 1
        
        if x == x2, y == y2 {
            break
        }
        
        for i in 0..<4 {
            var nx = x + dx[i]
            var ny = y + dy[i]
            var nk = 0
            
            while 0..<n ~= nx, 0..<m ~= ny, visited[nx][ny] > visited[x][y], graph[nx][ny] == ".", nk < k {
                if visited[nx][ny] == Int.max {
                    queue.append([nx, ny])
                    visited[nx][ny] = visited[x][y] + 1
                }
                nx += dx[i]
                ny += dy[i]
                nk += 1
            }
        }
    }
    
    print(visited[x2][y2] == Int.max ? -1 : visited[x2][y2])
}
