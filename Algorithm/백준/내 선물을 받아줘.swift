//
//  내 선물을 받아줘.swift
//  Algorithm
//  dfs
//  Created by 전소영 on 2024/02/06.
//

import Foundation
//3 4
//SWWW
//SEWN
//EEEN

//SWWW
//ENSW
//EEEN
// 2
func solution15559() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
    var graph: [[String]] = []
    let directions = ["S": 0, "N": 1, "E": 2, "W": 3]
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    var count = 0
    var answer = 0
    
    for _ in 0..<n {
        let input = readLine()!.map { String($0) }
        graph.append(input)
    }
    
    func dfs(_ x: Int, _ y: Int) {
        let d = directions[graph[x][y]]!
        let nx = x + dx[d]
        let ny = y + dy[d]
        
        if 0..<n ~= nx, 0..<m ~= ny {
            if visited[nx][ny] == 0 {
                visited[nx][ny] = count
                dfs(nx, ny)
            } else if visited[nx][ny] == count {
                answer += 1
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if visited[i][j] == 0 {
                count += 1
                visited[i][j] = count
                dfs(i, j)
            }
        }
    }
    
    print(answer)
}
