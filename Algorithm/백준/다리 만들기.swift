//
//  다리 만들기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/12/19.
//

import Foundation
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 1 1 0 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0
// -> 3
func solution2146() {
    let n = Int(readLine()!)!
    var graph: [[Int]] = []
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var dictionary: [Int: [(Int, Int)]] = [:]
    var answer = Int.max
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graph.append(input)
    }
    
    func bfs1(_ x: Int, _ y: Int, _ number: Int) {
        graph[x][y] = number
        var queue = [(x, y)]
        dictionary[number] = [(x, y)]
        
        while !queue.isEmpty {
            let q = queue.removeFirst()
            let qx = q.0
            let qy = q.1
            
            for i in 0..<4 {
                let nx = qx + dx[i]
                let ny = qy + dy[i]
                
                if 0..<n ~= nx, 0..<n ~= ny, graph[nx][ny] == 1 {
                    graph[nx][ny] = number
                    dictionary[number]!.append((nx, ny))
                    queue.append((nx, ny))
                }
            }
        }
    }
    
    func bfs2(_ number: Int) -> Int {
        var queue = dictionary[number]!
        var distance = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        
        queue.forEach {
            distance[$0][$1] = 0
        }
        
        while !queue.isEmpty {
            let q = queue.removeFirst()
            
            let qx = q.0
            let qy = q.1
            
            if graph[qx][qy] != 0, graph[qx][qy] != number { // 바다 x, 다른 섬일 때
                return distance[qx][qy]
            }
            
            for i in 0..<4 {
                let nx = qx + dx[i]
                let ny = qy + dy[i]
                
                if 0..<n ~= nx, 0..<n ~= ny, distance[nx][ny] > distance[qx][qy] + 1 { //  경계선 바다일 때
                    distance[nx][ny] = distance[qx][qy] + 1
                    queue.append((nx, ny))
                }
            }
        }
                
        return Int.max
    }
    
    var number = 2
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == 1 {
                bfs1(i, j, number)
                number += 1
            }
        }
    }

    for i in 2..<number {
        let length = bfs2(i)
        answer = min(answer, length)
    }
    
    print(answer - 1)
}
