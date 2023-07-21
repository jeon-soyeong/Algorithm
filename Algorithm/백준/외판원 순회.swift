//
//  외판원 순회.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/20.
//

import Foundation
//4
//0 10 15 20
//5  0  9 10
//6 13  0 12
//8  8  9  0
func solution2098() {
    let n = Int(readLine()!)!
    var w: [[Int]] = []
    var dp = Array(repeating: Array(repeating: -1, count: 1 << n), count: n)
    let max = 987654321

    for _ in 0..<n {
        w.append(readLine()!.split(separator: " ").map { Int(String($0))!} )
    }

    func dfs(_ now: Int, _ visited: Int) -> Int {
        // 모두 방문했다면
        if visited == (1 << n) - 1 {
            return w[now][0] != 0 ? w[now][0] : max
        }
        // 이미 방문한 적이 있다면
        if dp[now][visited] != -1 {
            return dp[now][visited]
        }

        dp[now][visited] = max

        for i in 0..<n {
            // 갈 수 있고 방문하지 않은 곳
            if w[now][i] != 0, (visited & (1 << i) == 0) {
                // 현재 도시(now)에서 방문한 도시들(visited) 일때 도시 전체를 순회한 최소 비용.
                dp[now][visited] = min(dp[now][visited], dfs(i, visited | (1 << i)) + w[now][i])
            }
        }

        return dp[now][visited]
    }

    print(dfs(0, 1))
}
