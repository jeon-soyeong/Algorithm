//
//  연결 요소의 개수.swift
//  Algorithm
//  
//  Created by 전소영 on 2023/12/06.
//

import Foundation
//6 5
//1 2
//2 5
//5 1
//3 4
//4 6
func solution11724() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0]
    let m = nm[1]
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    var answer = 0
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    var queue = [1]

    for i in 1...n {
        if !visited[i] {
            answer += 1
            queue.append(i)
        }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
    
            for g in graph[node] {
                if !visited[g] {
                    visited[g] = true
                    queue.append(g)
                }
            }
        }
    }
    
    print(answer)
}
