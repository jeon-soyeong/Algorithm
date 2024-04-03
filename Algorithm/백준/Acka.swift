//
//  Acka.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/03.
//

import Foundation

func solution12996() {
    let n = readLine()!.split(separator: " ").map { Int($0)! }
    let s = n[0], a = n[1], b = n[2], c = n[3]
    var dp = Array(repeating: Array(repeating: Array(repeating: Array(repeating: -1, count: 51), count: 51), count: 51), count: 51)
    let mod = 1000000007

    func solve(_ s: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
        if s == 0 {
            if a == 0, b == 0, c == 0 {
                return 1
            } else {
                return 0
            }
        }
        
        if a < 0 || b < 0 || c < 0 {
            return 0
        }
        
        if dp[s][a][b][c] != -1 {
            return dp[s][a][b][c]
        }
        
        dp[s][a][b][c] = 0
        dp[s][a][b][c] += solve(s - 1, a - 1, b, c)
        dp[s][a][b][c] += solve(s - 1, a, b - 1, c)
        dp[s][a][b][c] += solve(s - 1, a, b, c - 1)
        dp[s][a][b][c] += solve(s - 1, a - 1, b - 1, c)
        dp[s][a][b][c] += solve(s - 1, a, b - 1, c - 1)
        dp[s][a][b][c] += solve(s - 1, a - 1, b, c - 1)
        dp[s][a][b][c] += solve(s - 1, a - 1, b - 1, c - 1)
        dp[s][a][b][c] %= mod
        
        return dp[s][a][b][c]
    }

    print(solve(s, a, b, c))
}
