//
//  거울 설치.swift
//  Algorithm
//  bfs
//  Created by 전소영 on 2024/01/22.
//

import Foundation
//#이라는 문에 대해서 어느 방향에서든 출발해도 상관없음.
//빈칸 ‘.’에 대해 진행방향 그대로 직진만 가능.
//‘!’ 칸은 거울 설치 가능한 곳으로써 해당 자리에 거울을 45도 설치 가능.
//거울을 설치하게 되면 빛은 직진이 아닌 90도, 180도로 이동 가능.
//예를 들어 아래로 내려가다가 !를 만나면 왼쪽 또는 오른쪽으로 굴절이 가능. 물론 거울을 설치하지 않는다고 하면 그대로 직진.

//5
//***#*
//*.!.*
//*!.!*
//*.!.*
//*#***
//2
func solution2151() {
    let n = Int(readLine()!)!
    var graph: [[String]] = []
    var visited = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 4), count: n), count: n)
    let dx = [-1, 0, 1, 0] // 북 동 남 서
    let dy = [0, 1, 0, -1]
    var start: (Int, Int) = (0, 0)
    var end: (Int, Int) = (0, 0)

    for _ in 0..<n {
        let input = readLine()!.map { String($0) }
        graph.append(input)
    }

    func bfs(_ x: Int, _ y: Int) {
        var queue: [(Int, Int, Int, Int)] = []

        for i in 0..<4 {
            queue.append((x, y, 0, i))
        }

        while !queue.isEmpty {
            let q = queue.removeFirst()
            let (x, y, count, direction) = q
            let nx = x + dx[direction]
            let ny = y + dy[direction]

            if 0 > nx || n <= nx || 0 > ny || n <= ny || graph[nx][ny] == "*" { continue }
            if graph[nx][ny] == "!" {
                for i in stride(from: 1, through: 3, by: 2) { // 1 3 
                    if visited[nx][ny][(direction + i) % 4] > count + 1 {
                        visited[nx][ny][(direction + i) % 4] = count + 1
                        queue.append((nx, ny, count + 1, (direction + i) % 4))
                    }
                }
            }
            // 거울 배치 X는 경우
            if visited[nx][ny][direction] > count {
                visited[nx][ny][direction] = count
                queue.append((nx, ny, count, direction))
            }
        }
    }

    var startCheck = false
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == "#" {
                if !startCheck {
                    start = (i, j)
                    startCheck = true
                } else {
                    end = (i, j)
                }
            }
        }
    }

    bfs(start.0, start.1)

    print(visited[end.0][end.1].min()!)
}
