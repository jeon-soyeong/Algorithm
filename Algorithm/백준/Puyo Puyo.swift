//
//  Puyo Puyo.swift
//  Algorithm
//
//  Created by 전소영 on 2024/01/03.
//

import Foundation
//    ......
//    ......
//    ......
//    ......
//    ......
//    ......
//    ......
//    ......
//    .Y....
//    .YG...
//    RRYG..
//    RRYGG.
// 3
func solution11559() {
    var graph: [[String]] = []
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var answer = 0
    var temp: [(Int, Int)] = []
    var visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
    
    for _ in 0..<12 {
        graph.append(readLine()!.map { String($0) })
    }

    func remove(_ array: [(Int, Int)]) { // 4개 이상일 때
        for a in array {
            graph[a.0][a.1] = "."
        }
    }
    
    func down() { // 밑으로 내리기
        for i in 0..<6 {
            for j in (1..<12).reversed() {
                if graph[j][i] != "." { continue }
                var k = j - 1
              
                while k >= 0 {
                    if graph[k][i] == "." {
                        k -= 1
                        continue
                    }
                    graph[j][i] = graph[k][i]
                    graph[k][i] = "."
                    break
                }
            }
        }
    }
    
    func bfs(_ x: Int, _ y: Int) { // 4칸 확인
        var queue = [(x, y)]
        temp.append((x, y))
        
        while !queue.isEmpty {
            let q = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = q.0 + dx[i]
                let ny = q.1 + dy[i]
                
                if 0..<12 ~= nx, 0..<6 ~= ny, graph[x][y] == graph[nx][ny] , !visited[nx][ny] {
                    queue.append((nx, ny))
                    temp.append((nx, ny))
                    visited[nx][ny] = true
                }
            }
        }
    }
    
    while true {
        var flag = 0
        visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
        
        for i in 0..<12 {
            for j in 0..<6 {
                if graph[i][j] != ".", !visited[i][j] {
                    visited[i][j] = true
                    temp = []
                    bfs(i, j)
                    
                    if temp.count >= 4 {
                        flag = 1
                        remove(temp)
                    }
                }
            }
        }
        
        if flag == 0 {
            break
        }
        
        down()
        answer += 1
    }
        
    print(answer)
}
