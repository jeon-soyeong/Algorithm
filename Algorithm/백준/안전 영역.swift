//
//  안전 영역.swift
//  Algorithm
//
//  Created by 전소영 on 2023/12/13.
//

import Foundation

//5
//6 8 2 6 2
//3 2 3 4 6
//6 7 3 3 2
//7 2 5 3 6
//8 9 5 2 7
// -> 5
func solution2468() {
    let n = Int(readLine()!)!
    var graph = Array(repeating: [Int](), count: n)
    var visited: [[Bool]] = []
    let directions = [[-1, 0], [1, 0], [0, -1], [0, 1]] // 위 아래 왼 오
    var maxValue = 0
    var answer = 0
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        maxValue = max(maxValue, input.max()!)
        graph[i] = input
    }
    
    func dfs(i: Int, j: Int, h: Int) {
        visited[i][j] = true
        
        for direction in directions {
            let x = i + direction[0]
            let y = j + direction[1]
            
            if  0..<n ~= x, 0..<n ~= y {
                if graph[x][y] > h, !visited[x][y] {
                    dfs(i: x, j: y, h: h)
                }
            }
        }
    }
    
    for h in 1...maxValue {
        visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var safeArea = 0
        
        for i in 0..<graph.count {
            for j in 0..<graph[i].count {
                if graph[i][j] > h, !visited[i][j] {
                    safeArea += 1
                    dfs(i: i, j: j, h: h)
                }
            }
        }
        
        answer = max(answer, safeArea)
    }
    
    print(answer == 0 ? 1 : answer)
}
