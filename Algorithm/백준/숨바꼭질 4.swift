//
//  숨바꼭질 4.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/13.
//

import Foundation
// 5 17       4
//            5 10 9 18 17
func solution13913() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0]
    let k = input[1]
    var visited = Array(repeating: 100001, count: 100001)
    var path = Array(repeating: 100001, count: 100001)
    visited[n] = 0
    
    var queue = [n]
    var index = 0
    
    while index < queue.count {
        let q = queue[index]
        index += 1
        
        if q == k {
            print(visited[k])
            
            var paths: [Int] = []
            var temp = k
            
            while temp != n {
                paths.append(temp)
                temp = path[temp]
            }
            paths.append(n)
            print(paths.reversed().map { String($0) }.joined(separator: " "))
            
            break
        }
        
        for next in [q * 2, q - 1, q + 1] where 0..<100001 ~= next {
            if visited[next] < visited[q] + 1 {
                continue
            }
            
            queue.append(next)
            visited[next] = visited[q] + 1
            path[next] = q
        }
    }
}
