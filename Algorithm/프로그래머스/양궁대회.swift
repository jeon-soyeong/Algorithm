//
//  양궁대회.swift
//  Algorithm
//
//  Created by 전소영 on 2022/05/13.
//

import Foundation
//5, [2,1,1,1,0,0,0,0,0,0,0]    [0,2,2,0,1,0,0,0,0,0,0]
func solution92342(_ n: Int, _ info: [Int]) -> [Int] {
    var maxDifference: Int = 0
    var maxDifferenceRyanList: [Int] = []
    var dfs = [(0, 0, 0, 0, Array(repeating: 0, count: 11))]
    
    while dfs.count > 0 {
        let now = dfs.removeLast()
        let apeachScore = now.0
        let ryanScore = now.1
        let index = now.2
        let count = now.3
        var ryanList = now.4
        
        if count > n { //라이언이 쏜 화살이 전체 화살 n 보다 더 많을 때
            continue
        }
        
        if index > 10 { // 전체 탐색 끝나면
            let diff = ryanScore - apeachScore
            if diff > maxDifference {
                ryanList[10] = n - count //남은 화살 0점에 쏘기
                maxDifferenceRyanList = ryanList
                maxDifference = diff
            }
            continue
        }
//        info = [2,1,1,1,0,0,0,0,0,0,0]
        if info[10 - index] > 0 { // 어피치 득점 O
            dfs.append((apeachScore + index, ryanScore, index + 1, count, ryanList))
        } else { // 둘다 득점 X
            dfs.append((apeachScore, ryanScore, index + 1, count, ryanList))
        }
        
        if count < n { // 라이언 득점 O
            ryanList[10 - index] = info[10 - index] + 1
            dfs.append((apeachScore, ryanScore + index, index + 1, count + info[10 - index] + 1, ryanList))
        }
    }
    //5, [2,1,1,1,0,0,0,0,0,0,0]    [0,2,2,0,1,0,0,0,0,0,0]
    return maxDifference == 0 ? [-1] : maxDifferenceRyanList
}
