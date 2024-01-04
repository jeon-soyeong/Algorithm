//
//  알파벳.swift
//  Algorithm
//  dfs
//  Created by 전소영 on 2024/01/04.
//

import Foundation
//2 4
//CAAB
//ADCB
// -> 3
func solution1987() {
    let rc = readLine()!.split(separator: " ").map { Int($0)! }
    let r = rc[0], c = rc[1]
    var graph: [[Int]] = []
    var answer = 1
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    for _ in 0..<r {
        graph.append(readLine()!.map { Int($0.asciiValue!) - 65 })
    }
    
    func dfs(_ x: Int, _ y: Int, _ count: Int, _ temp: Int) {
        answer = max(answer, count)
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0..<r ~= nx, 0..<c ~= ny {
                let a = 1 << graph[nx][ny]
                if temp & a == 0 { // 아직 방문 하지 않았다면
                    dfs(nx, ny, count + 1, temp | a) // or 연산으로 합쳐주기
                }
            }
        }
    }
    
    dfs(0, 0, 1, 1 << graph[0][0])
    print(answer)
}
