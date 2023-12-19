//
//  성곽.swift
//  Algorithm
//
//  Created by 전소영 on 2023/12/18.
//

import Foundation
//7 4
//11 6 11 6 3 10 6
//7 9 6 13 5 15 5
//1 10 12 7 13 7 5
//13 11 10 8 10 12 13

//5  방의 개수
//9  가장 넓은 방의 넓이
//16 하나의 벽을 제거하여 얻을 수 있는 가장 넓은 방의 크기
func solution2234() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var graph: [[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)

    let dx = [0, -1, 0, 1]
    let dy = [-1, 0, 1, 0]

    var roomCount = 0
    var maximumRoomSize = 0
    var maximumRoomSizeByRemovingWall = 0

    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graph.append(input)
    }

    func bfs(_ x: Int, _ y: Int) -> Int {
        var roomSize = 0
        var queue = [(x, y)]
        visited[x][y] = true
        
        while !queue.isEmpty {
            roomSize += 1
            let q = queue.removeFirst()
            let qx = q.0
            let qy = q.1
            
            var wall = 1 // 1, 2, 4, 8
            
            for i in 0..<4 {
                if graph[qx][qy] & wall != wall { //  벽이 없다. ->   11 & 1 = 1011 & 0001 = 0001    11 & 2 = 1011 & 0010 = 0010   11 & 4 = 1011 & 0100 = 0000(벽 x)
                    let nx = qx + dx[i]
                    let ny = qy + dy[i]
                    
                    if 0..<m ~= nx, 0..<n ~= ny, !visited[nx][ny] {
                        visited[nx][ny] = true
                        queue.append((nx, ny))
                    }
                }
                wall *= 2 // 서 북 동 남 check
            }
        }
        
        return roomSize
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if !visited[i][j] {
                maximumRoomSize = max(maximumRoomSize, bfs(i, j))
                roomCount += 1
            }
        }
    }
    
    // 한쪽 벽을 허물어
    for i in 0..<m {
        for j in 0..<n {
            var wall = 1
            while wall <= 8 { // 서 북 동 남 check
                if graph[i][j] & wall == wall { // 벽이 있다면
                    visited = Array(repeating: Array(repeating: false, count: n), count: m)
                    graph[i][j] -= wall
                    maximumRoomSizeByRemovingWall = max(maximumRoomSizeByRemovingWall, bfs(i, j))
                    graph[i][j] += wall
                }
                wall *= 2
            }
        }
    }
    
    print(roomCount)
    print(maximumRoomSize)
    print(maximumRoomSizeByRemovingWall)
}
