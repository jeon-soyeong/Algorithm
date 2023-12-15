//
//  영역 구하기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/12/14.
//

import Foundation
//5 7 3
//0 2 4 4
//1 1 2 5
//4 0 6 2

//3
//1 7 13
func solution2583() {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnk[0], n = mnk[1], k = mnk[2]
    let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    var graph = Array(repeating: Array(repeating: 0, count: n), count: m)
    var area = 0
    var areas: [Int] = []
    
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x1 = input[0], y1 = input[1], x2 = input[2], y2 = input[3]
        
        for x in x1..<x2 {
            for y in y1..<y2 {
                graph[y][x] = 1
            }
        }
    }
    
    func dfs(_ x: Int, _ y: Int) {
        if graph[x][y] == 0 {
            graph[x][y] = 1
            area += 1
            
            for direction in directions {
                let nx = x + direction[0]
                let ny = y + direction[1]
    
                if 0..<m ~= nx, 0..<n ~= ny, graph[nx][ny] == 0 {
                    dfs(nx, ny)
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if graph[j][i] == 0 {
                area = 0
                dfs(j, i)
                areas.append(area)
            }
        }
    }
    
    areas.sort()
    print(areas.count)
    print(areas.map { String($0) }.joined(separator: " "))
}
