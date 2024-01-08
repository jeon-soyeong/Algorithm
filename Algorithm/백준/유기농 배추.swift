//
//  유기농 배추.swift
//  Algorithm
//  dfs
//  Created by 전소영 on 2024/01/08.
//

import Foundation
//2
//10 8 17
//0 0
//1 0
//1 1
//4 2
//4 3
//4 5
//2 4
//3 4
//7 4
//8 4
//9 4
//7 5
//8 5
//9 5
//7 6
//8 6
//9 6
//10 10 1
//5 5
func solution1012() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let nmk = readLine()!.split(separator: " ").map { Int($0)! }
        let n = nmk[0], m = nmk[1], k = nmk[2]
        var graph = Array(repeating: Array(repeating: 0, count: n), count: m)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var result = 0
        let dx = [0, 0, -1, 1]
        let dy = [-1, 1, 0, 0]
        
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            graph[input[1]][input[0]] = 1
        }
        
        func dfs(_ x: Int, _ y: Int) {
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                                    
                if 0..<m ~= nx, 0..<n ~= ny, graph[nx][ny] == 1, !visited[nx][ny] {
                    visited[nx][ny] = true
                    dfs(nx, ny)
                }
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if graph[i][j] == 1, !visited[i][j] {
                    dfs(i, j)
                    result += 1
                }
            }
        }
        print(result)
    }
}
