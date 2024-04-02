//
//  ABC.swift
//  Algorithm
//  dp
//  Created by 전소영 on 2024/04/02.
//

import Foundation
//3 3 ABC
//3 0 CBA
func solution12969() {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nk[0], k = nk[1]
    var s = Array(repeating: "", count: n)
    var dp = Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: 436), count: 31), count: 31), count: 31)
    
    func solve(_ i: Int, _ a: Int, _ b: Int, _ p: Int) -> Bool {
        if i == n {
            if p == k {
                return true
            } else {
                return false
            }
        }
        
        if dp[i][a][b][p] {
            return false
        }
        dp[i][a][b][p] = true
        
        s[i] = "A"
        if solve(i + 1, a + 1, b, p) {
            return true
        }
        
        s[i] = "B"
        if solve(i + 1, a, b + 1, p + a) {
            return true
        }
        
        s[i] = "C"
        if solve(i + 1, a, b, p + a + b) {
            return true
        }
        
        return false
    }
    
    print(solve(0, 0, 0, 0) ? s.joined() : -1)
}
