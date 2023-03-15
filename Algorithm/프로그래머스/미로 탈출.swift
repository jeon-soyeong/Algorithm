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
    var mapArray = maps.map { Array($0) }

    var start = (0, 0)
    var lever = (0, 0)
    var end = (0, 0)

    for i in mapArray.indices {
        for j in mapArray[i].indices {
            if mapArray[i][j] == "S" {
                start = (i, j)
            } else if mapArray[i][j] == "L" {
                lever = (i, j)
            } else if mapArray[i][j] == "E" {
                end = (i, j)
            }
        }
    }

    let column = mapArray[0].count
    let row = mapArray.count
    let dx = [0, 0, 1, -1]
    let dy = [-1, 1, 0, 0]

    func bfs(_ from: (Int, Int), _ to: (Int, Int)) -> Int {
        var distance: [[Int]] = Array(repeating: [Int](repeating: -1, count: column), count: row)
        var queue: [(Int, Int)] = [(from.0, from.1)]
        distance[from.0][from.1] = 0

        while !queue.isEmpty {
            let (qx, qy) = queue.removeFirst()
            for i in dx.indices {
                let nx = qx + dx[i]
                let ny = qy + dy[i]
                if nx < 0 || ny < 0 || nx >= row || ny >= column || distance[nx][ny] != -1 || mapArray[nx][ny] == "X" { continue }
                if nx == to.0 && ny == to.1 {
                    return distance[qx][qy] + 1
                }
                distance[nx][ny] = distance[qx][qy] + 1
                queue.append((nx, ny))
            }
        }
        return -1
    }

    let sToL = bfs(start, lever)
    let LtoE = bfs(lever, end)

    if sToL == -1 || LtoE == -1 {
        return -1
    }
    return sToL + LtoE
}
