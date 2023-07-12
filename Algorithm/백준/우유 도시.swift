//
//  우유 도시.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/10.
//

import Foundation

//4
//0 1 2 2
//1 1 1 1
//2 2 2 2
//0 0 1 0
// == 5
func solution14722() {
    let n = Int(readLine()!)!
    let direction = [[0, 1], [1, 0]]
    var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: n), count: n)
    var milkArray: [[Int]] = []
    
    for _ in 0..<n {
        let array = readLine()!.split(separator: " ").map { Int(String($0))! }
        milkArray.append(array)
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if milkArray[i][j] == 0 {
                dp[i][j][0] = max(dp[i][j][0], 1)
            }
            
            for k in 0..<direction.count {
                let np = [i + direction[k][0], j + direction[k][1]] // 동, 남쪽 두 방향
                if np[0] >= n || np[1] >= n {
                    continue
                }
                
                for milk in 0..<3 { // 딸, 초, 바 우유 탐색
                    let movedMilk = milkArray[np[0]][np[1]]
                    
                    if dp[i][j][milk] != 0, (milk >= 2 ? 0 : milk + 1) == movedMilk {
                        dp[np[0]][np[1]][movedMilk] = max(dp[np[0]][np[1]][movedMilk], dp[i][j][milk] + 1)
                    } else {
                        dp[np[0]][np[1]][milk] = max(dp[np[0]][np[1]][milk], dp[i][j][milk])
                    }
                }
                
            }
        }
    }

    print(dp[n - 1][n - 1].max()!)
}
