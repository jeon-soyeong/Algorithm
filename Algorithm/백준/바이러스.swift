//
//  바이러스.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/10.
//

import Foundation
//7     4
//6
//1 2
//2 3
//1 5
//5 2
//5 6
//4 7
func solution2606() {
    let computerCount = Int(readLine()!)!
    let n = Int(readLine()!)!
    var graph: [Int: [Int]] = [:]
    var visited = Array(repeating: false, count: computerCount + 1)
    var answer = 0
    
    for i in 1...computerCount {
        graph[i] = []
    }
    
    for _ in 0..<n {
        let computer = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[computer[0]]?.append(computer[1])
        graph[computer[1]]?.append(computer[0])
    }

    func dfs(_ n: Int) {
        if !visited[n] {
            visited[n] = true
            
            for e in graph[n]! {
                if !visited[e] {
                    answer += 1
                    dfs(e)
                }
            }
        }
    }
    
    dfs(1)
    print(answer)
}
