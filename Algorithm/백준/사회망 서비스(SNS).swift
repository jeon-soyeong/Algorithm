//
//  사회망 서비스(SNS).swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/03/15.
//

import Foundation

func solution2533() {
    let n = Int(readLine()!)!
    var dictionary: [Int: [Int]] = [:]
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
  
    for _ in 0..<n - 1 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let node1 = input[0]
        let node2 = input[1]
            
        if dictionary[node1] == nil {
            dictionary[node1] = [node2]
        } else {
            dictionary[node1]?.append(node2)
        }
        
        if dictionary[node2] == nil {
            dictionary[node2] = [node1]
        } else {
            dictionary[node2]?.append(node1)
        }
    }
    
    func dfs(_ node: Int) {
        //dp[i][0] i번째가 얼리어답터가 X 경우 -> next는 무조건 [next][1] 얼리어답터
        //dp[i][1] i번째가 얼리어답터가 O 경우 -> 둘 중 작은 값
        visited[node] = true
        dp[node][1] = 1
        
        for next in dictionary[node]! {
            if visited[next] {
                continue
            }
            dfs(next)
            dp[node][0] += dp[next][1]
            dp[node][1] += min(dp[next][0], dp[next][1])
        }
    }
    
    dfs(1)
    print(min(dp[1][0], dp[1][1]))
}
