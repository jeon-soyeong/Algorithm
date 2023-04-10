//
//  음식물 피하기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/10.
//

import Foundation
//3 4 5       4
//3 2
//2 2
//3 1
//2 3
//1 1
//
//1 0 0 0
//0 1 1 0
//1 1 0 0
func solution1743() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let row = input[0]
    let column = input[1]
    let trashCount = input[2]
    var trashPoint: [[Int]] = []
    var graph = Array(repeating: Array(repeating: 0, count: column), count: row)
    var visited = Array(repeating: Array(repeating: false, count: column), count: row)
    
    let dx = [-1, 1, 0 ,0]
    let dy = [0, 0, -1, 1]
    
    var answer = 0
    var count = 0
    
    for _ in 0..<trashCount {
        trashPoint.append(Array(readLine()!.split(separator: " ").map { Int(String($0))! }))
    }
    
    for point in trashPoint {
        graph[point[0] - 1][point[1] - 1] = 1
    }
    
    for i in 0..<row {
        for j in 0..<column {
            if !visited[i][j], graph[i][j] == 1 {
                count = 0
                dfs(i, j)
                answer = max(answer, count)
            }
        }
    }
    
    func dfs(_ x: Int, _ y: Int) {
        visited[x][y] = true
        count += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0..<row ~= nx, 0..<column ~= ny, !visited[nx][ny], graph[nx][ny] == 1 {
                dfs(nx, ny)
            }
        }
    }
    
    print(answer)
}
