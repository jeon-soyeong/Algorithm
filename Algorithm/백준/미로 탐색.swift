//
//  미로 탐색.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/08.
//

import Foundation
//4 6
//101111
//101010
//101011
//111011
func solution2178() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]

    var graph: [[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)

    let dx = [-1, 1, 0, 0]
    let dy = [0 ,0, -1, 1]
    var nx = 0
    var ny = 0

    var queue = [[0, 0]]
    var x = queue[0][0]
    var y = queue[0][1]

    visited[0][0] = true

    for _ in 0..<n {
        graph.append(Array(readLine()!.map { Int(String($0))! }))
    }

    while !queue.isEmpty {
        x = queue[0][0]
        y = queue[0][1]

        queue.removeFirst()

        for i in 0..<4 {
            nx = x + dx[i]
            ny = y + dy[i]

            if 0..<n ~= nx, 0..<m ~= ny, !visited[nx][ny], graph[nx][ny] == 1 {
                visited[nx][ny] = true
                queue.append([nx, ny])
                graph[nx][ny] = graph[x][y] + 1
            }
        }
    }

    print(graph[n - 1][m - 1])
}
