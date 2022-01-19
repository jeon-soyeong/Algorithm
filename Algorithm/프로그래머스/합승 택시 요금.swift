//
//  합승 택시 요금.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/19.
//

import Foundation

func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
    let maxFare = 200 * 100000
    var graph = (0..<n).map { _ in Array(repeating: maxFare, count: n) }
    
    for fare in fares {
        let f = fare[0] - 1
        let t = fare[1] - 1
        let cost = fare[2]
        
        graph[f][t] = cost
        graph[t][f] = cost
    }
    
    func froydWalshall() {
        for k in 0..<n {
            for i in 0..<n {
                if i == k || graph[i][k] == maxFare {
                    continue
                }
                for j in 0..<n {
                    if i == j || k == j {
                        continue
                    }
                    graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
                }
            }
        }
    }
    
    froydWalshall()
    
    var cost = graph[s - 1][a - 1] + graph[s - 1][b - 1]
    
    for i in 0..<n {
        let start = graph[s - 1][i]
        let a = a - 1 == i ? 0 : graph[i][a - 1]
        let b = b - 1 == i ? 0 : graph[i][b - 1]
        
        cost = min(cost, start + a + b)
    }
    
    return cost
}
