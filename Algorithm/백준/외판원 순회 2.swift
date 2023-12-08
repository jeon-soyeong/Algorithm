//
//  외판원 순회 2.swift
//  Algorithm
//  dfs
//  Created by 전소영 on 2023/12/07.
//

import Foundation
//4
//0 10 15 20
//5 0 9 10
//6 13 0 12
//8 8 9 0
//-> 35
func solution10971() {
    let n = Int(readLine()!)!
    var w: [[Int]] = Array(repeating: [], count: n)
    var visited = Array(repeating: false, count: n)
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        w[i] = input
    }

    var result = Int.max
    var sum = 0
    
    func dfs(_ depth: Int, _ now: Int, _ start: Int) { // 도시를 방문한 횟수
        if depth == n, now == start {
            result = min(result, sum)
            return
        }
        
        for i in 0..<n {
            if w[now][i] != 0, !visited[i] {
                visited[i] = true
                sum += w[now][i]
                dfs(depth + 1, i, start)
                visited[i] = false
                sum -= w[now][i]
            }
        }
    }
    
    dfs(0, 0, 0)
    
    print(result)
}
