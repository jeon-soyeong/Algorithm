//
//  최소비용 구하기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/09/26.
//

import Foundation

//5
//8
//1 2 2
//1 3 3
//1 4 1
//1 5 10
//2 4 2
//3 4 1
//3 5 1
//4 5 3
//1 5
func solution1916() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
    var visited = Array(repeating: Int.max, count: n + 1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[input[0]].append((input[1], input[2]))
    }
    
    for i in 0..<n {
        graph[i].sort(by: { $0.1 < $1.1 })
    }
    
    let startEnd = readLine()!.split(separator: " ").map { Int(String($0))! }
    let start = startEnd[0]
    let end = startEnd[1]
    
    var queue = [(start, 0)]
    
    while !queue.isEmpty {
        let (node, time) = queue.removeFirst() // 1, 5
        
        for i in graph[node] { // 2, 2    3, 3   4, 1    5, 10
            if visited[i.0] > time + i.1 {
                visited[i.0] = time + i.1
                queue.append((i.0, time + i.1))
            }
        }
    }
    
    print(visited[end])
}
