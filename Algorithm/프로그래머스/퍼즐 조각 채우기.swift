//
//  퍼즐 조각 채우기.swift
//  Algorithm
//  bfs
//  Created by 전소영 on 2024/01/17.
//

import Foundation

func solution84021(_ game_board: [[Int]], _ table: [[Int]]) -> Int {
    struct Point: Equatable {
        let x: Int
        let y: Int
    }
    
    var answer = 0
    var visited = Array(repeating: Array(repeating: false, count: 51), count: 51)
    var blocks: [[Point]] = []
    var blanks: [[Point]] = []
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    var results: [[Point]] = []
    
    
    func bfs(_ x: Int, _ y: Int, _ board: [[Int]], _ target: Int) -> [[Point]] {
        var queue: [(Int, Int)] = []
        var result: [(Int, Int)] = []
        
        queue.append((x, y))
        
        while !queue.isEmpty {
            let q = queue.removeFirst()
            result.append(q)
            
            for i in 0..<4 {
                let nx = q.0 + dx[i]
                let ny = q.1 + dy[i]
                
                if 0..<board.count ~= nx, 0..<board[i].count ~= ny, !visited[nx][ny], board[nx][ny] == target {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
        }
        
        let baseX = result.sorted(by: { $0.0 < $1.0 })[0].0
        let baseY = result.sorted(by: { $0.1 < $1.1 })[0].1
        results.append(result.map { Point(x: $0.0 - baseX, y: $0.1 - baseY) })
        
        return results
    }
    
    func rotate(array: [Point]) -> [Point] {
        let maxX = array.max(by: { $0.x < $1.x })!.x
        return array.map { Point(x: $0.y, y: maxX - $0.x) }
    }
    
    for i in 0..<game_board.count {
        for j in 0..<game_board[i].count {
            if !visited[i][j], game_board[i][j] == 0 {
                visited[i][j] = true
                blanks = bfs(i, j, game_board, 0)
            }
        }
    }
    
    visited = Array(repeating: Array(repeating: false, count: 51), count: 51)
    results = []
    
    for i in 0..<table.count {
        for j in 0..<table[i].count {
            if !visited[i][j], table[i][j] == 1 {
                visited[i][j] = true
                blocks = bfs(i, j, table, 1)
            }
        }
    }
    
    outer: for blank in blanks {
        for (index, block) in blocks.enumerated() {
            if blank.count != block.count {
                continue
            }
            var temp = block
            for _ in 0..<4 {
                let rotatedBlock = rotate(array: temp)
                temp = rotatedBlock

                if rotatedBlock.sorted(by: { ($0.x, $0.y) < ($1.x, $1.y) }) == blank.sorted(by: { ($0.x, $0.y) < ($1.x, $1.y) }) {
                    answer += block.count
                    blocks.remove(at: index)
                    continue outer

                }
            }
        }
    }
   
    return answer
}
