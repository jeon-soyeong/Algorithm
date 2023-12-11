//
//  순열 사이클.swift
//  Algorithm
//
//  Created by 전소영 on 2023/12/11.
//

import Foundation
//2
//8
//3 2 7 8 1 4 5 6
//10
//2 1 3 4 5 6 7 9 10 8
func solution10451() {
    let n = Int(readLine()!)!
    var visited: [Bool] = []
    var array: [Int] = []
    var answer = 0

    for _ in 0..<n {
        array = [0]
        answer = 0
        
        let count = Int(readLine()!)!
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        array.append(contentsOf: input)
        visited = Array(repeating: false, count: array.count)
        
        for i in 1..<array.count {
            if !visited[i] {
                dfs(i)
                answer += 1
            }
        }
        print(answer)
    }

    func dfs(_ node: Int) {
        if !visited[node] {
            visited[node] = true
            dfs(array[node])
        }
    }
}
