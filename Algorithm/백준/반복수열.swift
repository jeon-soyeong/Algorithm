//
//  반복수열.swift
//  Algorithm
//  dfs
//  Created by 전소영 on 2023/12/13.
//

import Foundation

// 57 2 -> 4
//[57, 74(=52+72=25+49), 65, 61, 37, 58, 89, 145, 42, 20, 4, 16, 37, …]
func solution2331() {
    var visited = Array(repeating: 0, count: 250000)
    let ap = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ap[0], p = ap[1]
    
    func dfs(_ a: Int, _ index: Int) {
        if visited[a] == 0 { // 방문한 적이 없다면
            visited[a] = index
            
            var sum = 0
            let array = Array(String(a)).map { Int(String($0))! }
            for i in 0..<array.count {
                let s = pow(Double(array[i]), Double(p))
                sum += Int(s)
            }
            
            dfs(sum, index + 1)
        } else { // 이미 방문한 적이 있다면
            print(visited[a] - 1)
            return
        }
    }
    
    dfs(a, 1)
}
