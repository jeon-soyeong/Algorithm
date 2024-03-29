//
//  빛의 경로 사이클.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/04.
//

import Foundation

struct Location: Equatable {
    var x: Int, y: Int, d: String
}

// grid            result
// ["SL","LR"]    [16]
// ["S"]        [1,1,1,1]
// ["R","R"]    [4,4]

//dValue: 방향에 따라 위치가 바뀌어야할 값
//next: 진행된 방향이 우회전 좌회전 직진에 따라 바뀔 방향
//answer: 사이클의 길이들
//g: grid의 이중 배열
//visited: 각 칸의 방향별 방문이력을 저장

func gridSolution(_ grid: [String]) -> [Int] {
    let dValue = ["up": (0, -1), "down": (0, 1), "left": (-1, 0), "right": (1, 0)]
    let next: [String: [String: String]] = ["L": ["down": "right", "right": "up", "up": "left", "left": "down"], "R": ["down": "left", "right": "down", "up": "right", "left": "up"], "S": ["down": "down", "right": "right", "up": "up", "left": "left"]]
    var answer: [Int] = []
    let g = grid.map { $0.map { String($0) }}
    var visited = Array(repeating: Array(repeating: ["up": false, "down": false, "right": false, "left": false], count: g[0].count), count: g.count)

    for y in 0..<g.count {
        for x in 0..<g[0].count {
            for d in dValue.keys {
                let first = Location(x: x, y: y, d: d)
                var location: Location = first
                var count: Int = 0
                while true {
                    if visited[location.y][location.x][location.d]! { break }
                    visited[location.y][location.x][location.d] = true
                    count += 1
                    
                    let direction = g[location.y][location.x]
                    location.d = next[direction]![location.d]!
                    location.x += dValue[location.d]!.0
                    location.y += dValue[location.d]!.1
                    location.x = location.x < 0 ? g[0].count - 1 : location.x % g[0].count
                    location.y = location.y < 0 ? g.count - 1 : location.y % g.count
                    
                    if location == first && count != 0 {
                        answer.append(count)
                        break
                    }
                }
            }
        }
    }
    
    return answer.sorted()
}
