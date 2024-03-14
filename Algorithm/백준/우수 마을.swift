//
//  우수 마을.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/14.
//

import Foundation
//7
//1000 3000 4000 1000 2000 2000 7000
//1 2
//2 3
//4 3
//4 5
//6 2
//6 7
func solution1949() {
    let n = Int(readLine()!)!
    let people = readLine()!.split(separator: " ").map { Int($0)! }
    var dictionary: [Int: [Int]] = [:]
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    
    for _ in 0..<n - 1 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let node1 = input[0]
        let node2 = input[1]
        
        if dictionary[node1] != nil {
            dictionary[node1]?.append(node2)
        } else {
            dictionary[node1] = [node2]
        }
        
        if dictionary[node2] != nil {
            dictionary[node2]?.append(node1)
        } else {
            dictionary[node2] = [node1]
        }
    }
    
    func dfs(_ node: Int) {
        visited[node] = true
        
        dp[node][0] = 0 // 해당 노드의 마을이 우수 마을이 X 경우
        dp[node][1] = people[node - 1] //  해당 노드의 마을이 우수 마을인 경우
        
        for next in dictionary[node]! {
            if visited[next] {
                continue
            }
            dfs(next)
            
            dp[node][0] += max(dp[next][0], dp[next][1])
            dp[node][1] += dp[next][0]
        }
    }
    
    dfs(1)
    
    print(max(dp[1][0], dp[1][1]))
}
