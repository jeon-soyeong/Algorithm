//
//  케빈 베이컨의 6단계 법칙.swift
//  Algorithm
//
//  Created by 전소영 on 2023/12/14.
//

import Foundation
//5 5
//1 3
//1 4
//4 5
//4 3
//3 2
//-> 3 케빈 베이컨의 수가 가장 작은 사람, 여러명 이면 번호가 작은 사람
func solution1389() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var graph = Array(repeating: [Int](), count: n + 1)
    var answer = Array(repeating: Int.max, count: n + 1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    func bfs(_ start: Int) -> Int {
        var queue = [(start, 0)]
        var sum = 0
        var visited = Array(repeating: false, count: n + 1)
        visited[start] = true

        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            for g in graph[node.0] {
                if !visited[g] {
                    sum += node.1 + 1
                    visited[g] = true
                    queue.append((g, node.1 + 1))
                }
            }
        }
        
        return sum
    }
    
//    1은 2까지 3을 통해 2단계 만에, 3까지 1단계, 4까지 1단계, 5까지 4를 통해서 2단계 만에 알 수 있다. 따라서, 케빈 베이컨의 수는 2+1+1+2 = 6이다.
    for i in 1...n {
        answer[i] = bfs(i)
    }
    
    print(answer.firstIndex(of: answer.min()!)!)
}
