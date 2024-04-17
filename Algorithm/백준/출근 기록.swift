//
//  출근 기록.swift
//  Algorithm
//  dp, dfs
//  Created by 전소영 on 2024/04/17.
//

import Foundation

func solution14238() {
    let s = readLine()!.map { String($0) }
    let n = s.count
    var dp = Array(repeating: Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: 3), count: 3), count: n + 1), count: n + 1), count: n + 1)
    var counts = [0, 0, 0]
    var result = Array(repeating: "", count: n)
    
    for i in 0..<n {
        switch s[i] {
        case "A": counts[0] += 1
        case "B": counts[1] += 1
        case "C": counts[2] += 1
        default:
            break
        }
    }
    
    func dfs(_ a: Int, _ b: Int, _ c: Int, _ p1: Int, _ p2: Int) -> Bool {
        if [a, b, c] == counts {
            return true
        }
        
        if dp[a][b][c][p1][p2] { // 방문한 적이 있으면
            return false
        }
        
        dp[a][b][c][p1][p2]  = true
        
        if a < counts[0] {
            result[a + b + c] = "A"
           
            if dfs(a + 1, b, c, 0, p1) {
                return true
            }
        }
        
        if b < counts[1] {
            result[a + b + c] = "B"
            
            if p1 != 1 { // 바로 전 B가 아니면
                if dfs(a, b + 1, c, 1, p1) {
                    return true
                }
            }
        }
        
        if c < counts[2] {
            result[a + b + c] = "C"
            
            if p1 != 2, p2 != 2 { // 바로 전과 전전이 C가 아니면
                if dfs(a, b, c + 1, 2, p1) {
                    return true
                }
            }
        }
        
        return false
    }
    
    if dfs(0, 0, 0, 0, 0) {
        print(result.joined())
    } else {
        print(-1)
    }
}
