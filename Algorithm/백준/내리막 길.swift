//
//  내리막 길.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/18.
//

import Foundation
//4 5
//50 45 37 32 30
//35 50 40 20 25
//30 30 25 17 28
//27 24 22 15 10
func solution1520() {
    let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = mn[0]
    let n = mn[1]
    
    var dp = Array(repeating: Array(repeating: -1, count: n), count: m)
    var array: [[Int]] = []

    for _ in 0..<m {
        array.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    func dfs(x: Int, y: Int) -> Int {
        let dx = [1, -1, 0, 0]
        let dy = [0, 0, 1, -1]
        // 도착지점
        if x == m - 1, y == n - 1 {
            return 1
        }
        // 방문한 적이 있으면
        if dp[x][y] != -1 {
            return dp[x][y]
        }
        
        var count = 0
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0, ny >= 0, nx < m, ny < n, array[x][y] > array[nx][ny] {
                count += dfs(x: nx, y: ny)
            }
        }
        
        dp[x][y] = count
        return count
    }

    print(dfs(x: 0, y: 0))
}
