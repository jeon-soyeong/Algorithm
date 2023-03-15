//
//  미로 탈출.swift
//  Algorithm
//  - BFS
//  Created by 전소영 on 2023/03/14.
//

import Foundation
// ["SOOOL",
//  "XXXXO",
//  "OOOOO",
//  "OXXXX",
//  "OOOOE"]    16
func solution159993(_ maps: [String]) -> Int {
    var start = (0, 0), lever = (0, 0)
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    let mapArray = maps.map { Array($0) }

    for i in mapArray.indices {
        for j in mapArray[i].indices {
            if mapArray[i][j] == "S" {
                start = (j, i)
            } else if mapArray[i][j] == "L" {
                lever = (j, i)
            }
        }
    }

    func bfs(start: (Int, Int), end: String) -> Int? {
        var distance: [[Int]] = Array(repeating: [Int](repeating: -1, count: maps[0].count), count: maps.count)
        var queue: [(Int, Int)] = []
        distance[start.1][start.0] = 0
        queue.append(start)

        while !queue.isEmpty {
            let (qx, qy) = queue.removeFirst()
            for i in 0..<4 {
                let nx = qx + dx[i]
                let ny = qy + dy[i]
                if 0..<maps[0].count ~= nx, 0..<maps.count ~= ny,
                   mapArray[ny][nx] != "X", distance[ny][nx] == -1 {
                    if mapArray[ny][nx] == Character(end) {
                        return distance[qy][qx] + 1
                    }
                    distance[ny][nx] = distance[qy][qx] + 1
                    queue.append((nx, ny))
                }
            }
        }
        return nil
    }

    guard let sToL = bfs(start: start, end: "L") else { return -1 }
    guard let LtoE = bfs(start: lever, end: "E") else { return -1 }

    return sToL + LtoE
}
