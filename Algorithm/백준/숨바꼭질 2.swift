//
//  숨바꼭질 2.swift
//  Algorithm
//
//  Created by 전소영 on 2023/04/12.
//

import Foundation
//5 17     4
//         2
func solution12851() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0]
    let k = input[1]
    var visited = [Int](repeating: 100001, count: 100001)
    visited[n] = 0

    var queue = [n]
    var index = 0
    var time = 1000000
    var count = 0

    while index < queue.count {
        let x = queue[index]
        index += 1
        
        if x == k {
            time = visited[x]
            count += 1
        }
        
        for next in [x * 2, x - 1, x + 1] where 0...100000 ~= next {
            if visited[next] < visited[x] + 1 {
                continue
            }
            
            queue.append(next)
            visited[next] = visited[x] + 1
        }
    }

    print(time, count, separator: "\n")
}
