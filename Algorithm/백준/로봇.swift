//
//  로봇.swift
//  Algorithm
//  bfs
//  Created by 전소영 on 2023/12/26.
//

import Foundation
//5 6
//0 0 0 0 0 0
//0 1 1 0 1 0
//0 1 0 0 0 0
//0 0 1 1 1 0
//1 0 0 0 0 0
//4 2 3
//2 4 1
func solution1726() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    let rotations = [0: [2, 3], 1: [2, 3], 2: [0, 1], 3: [0, 1]]
    var graph: [[Int]] = []
    var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: m), count: n)

    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let end = readLine()!.split(separator: " ").map { Int($0)! }

    func bfs(_ x: Int, _ y: Int, _ d: Int) -> Int {
        visited[x][y][d] = 1
        var queue = [(x, y, d, 0)]

        while !queue.isEmpty {
            let (x, y, d, count) = queue.removeFirst()

            if x == end[0] - 1, y == end[1] - 1, d == end[2] - 1 {
                return count
            }

            for k in 1...3 { // 방향 같을 때 d 방향으로 k 만큼 이동
                let nx = x + dx[d] * k
                let ny = y + dy[d] * k
               
                if nx < 0 || nx >= n || ny < 0 || ny >= m || graph[nx][ny] == 1 { break } // 벽 X, 방문한 적 X
                if visited[nx][ny][d] == 0 {
                    visited[nx][ny][d] = 1
                    queue.append((nx, ny, d, count + 1))
                }
            }

            for rotation in rotations[d]! { // 오른쪽 or 왼쪽으로 90도 방향 변환
                if visited[x][y][rotation] == 0 {
                    visited[x][y][rotation] = 1
                    queue.append((x, y, rotation, count + 1))
                }
            }
        }

        return -1
    }
    
    print(bfs(start[0] - 1, start[1] - 1, start[2] - 1))
}
