//
//  코딩테스트 연습.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/07.
//

import Foundation

// alp      cop      problems                                                  result
// 10       10       [[10,15,2,1,2], [20,20,3,3,4]]                            15
// 0        0        [[0,0,2,1,2], [4,5,3,1,2], [4,11,4,0,2], [10,4,0,4,2]]    13
func solution118668(_ alp: Int, _ cop: Int, _ problems: [[Int]]) -> Int {
    var maxAlp = 0
    var maxCop = 0
    
    for problem in problems {
        maxAlp = max(maxAlp, problem[0])
        maxCop = max(maxCop, problem[1])
    }
    
    var dp = Array(repeating: Array(repeating: 10000, count: maxCop + 1), count: maxAlp + 1)
    let alp = min(alp, maxAlp)
    let cop = min(cop, maxCop)
    
    dp[alp][cop] = 0 // dp[i][j] : 알고력 i, 코딩력 j을 도달 할 수 있는 최단시간
    
    for i in alp...maxAlp {
        for j in cop...maxCop {
            if i + 1 <= maxAlp { // 알고리즘을 공부하여 알고력을 1 높이는 경우
                dp[i + 1][j] = min(dp[i + 1][j], dp[i][j] + 1)
            }
            if j + 1 <= maxCop { // 코딩을 공부하여 코딩력을 1 높이는 경우
                dp[i][j + 1] = min(dp[i][j + 1], dp[i][j] + 1)
            }
            
            for problem in problems { // 문제 하나를 선택하여 알고력과 코딩력을 높이는 경우
                if i >= problem[0], j >= problem[1] { // 문제를 풀 수 있다면
                    let nextAlp = min(maxAlp, i + problem[2])
                    let nextCop = min(maxCop, j + problem[3])
                    dp[nextAlp][nextCop] = min(dp[nextAlp][nextCop], dp[i][j] + problem[4])
                }
            }
        }
    }
    
    return dp[maxAlp][maxCop]
}
