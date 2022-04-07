//
//  배달.swift
//  Algorithm
//
//  Created by 전소영 on 2022/04/06.
//

import Foundation

func solution(_ N: Int, _ road: [[Int]], _ k: Int) -> Int {
    var answer = 0
    var roadArray = Array(repeating: Array(repeating: k + 1, count: N), count: N)
    roadArray[0][0] = 1
    
    for r in road {
        let a = r[0] - 1
        let b = r[1] - 1
        let value = r[2]
        
        if roadArray[a][b] > value {
            roadArray[a][b] = value
            roadArray[b][a] = value
        }
    }
    
    func floydWalshall() {
        for i in 0..<N {
            for j in 0..<N {
                for k in 0..<N {
                    roadArray[j][k] = min(roadArray[j][k], roadArray[j][i] + roadArray[i][k])
                }
            }
        }
    }
    
    floydWalshall()
    
    for i in 0..<N {
        if roadArray[0][i] <= k {
            answer += 1
        }
    }
    
    return answer
}
