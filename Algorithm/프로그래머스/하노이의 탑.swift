//
//  하노이의 탑.swift
//  Algorithm
//
//  Created by 전소영 on 2022/11/01.
//

import Foundation

func solution12946(_ n: Int) -> [[Int]] {
    var result: [[Int]] = []

    func hanoi(n: Int, start: Int, end: Int, mid: Int) {
        if n == 1 {
            result.append([start, end])
            return
        } else {
            hanoi(n: n - 1, start: start, end: mid, mid: end)
            result.append([start, end])
            hanoi(n: n - 1, start: mid, end: end, mid: start)
        }
    }

    hanoi(n: n, start: 1, end: 3, mid: 2)
    
    return result
}
