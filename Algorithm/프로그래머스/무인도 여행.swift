//
//  무인도 여행.swift
//  Algorithm
//  - DFS
//  Created by 전소영 on 2023/03/05.
//

import Foundation
//maps                                  result
//["X591X","X1X5X","X231X", "1XXX1"]    [1, 1, 27]
//["XXX","XXX","XXX"]                   [-1]
func solution154540(_ maps: [String]) -> [Int] {
    var result: [Int] = []
    let map = maps.reduce(into: [[Character]]()) { result, map in
        result.append(Array(map))
    }
    let row = map.count
    let column = map[0].count
    var visited = Array(repeating: Array(repeating: false, count: column), count: row)
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    func dfs(i: Int, j: Int) -> Int {
        if map[i][j] == "X" {
            return 0
        }
        var sum = (map[i][j]).wholeNumberValue!
        visited[i][j] = true
        
        for k in 0..<dx.count {
            let x = i + dx[k]
            let y = j + dy[k]
            
            if x >= row || y >= column || x < 0 || y < 0 || visited[x][y] {
                continue
            }
            visited[x][y] = true
            sum += dfs(i: x, j: y)
        }
        
        return sum
    }
    
    for i in 0..<row {
        for j in 0..<column {
            if !visited[i][j], map[i][j] != "X" {
                let sum = dfs(i: i, j: j)
                if sum > 0 {
                    result.append(sum)
                }
            }
        }
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}
