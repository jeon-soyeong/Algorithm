//
//  레이스.swift
//  Algorithm
//  - 이분 탐색
//  Created by 전소영 on 2021/10/5.
//

import Foundation

func race() {
    let q = readLine()!.split(separator: " " ).map{Int(String($0))!}
    let N = q[0], M = q[1], K = q[2]
    let list = readLine()!.split(separator: " " ).map{Int(String($0))!}

    if M >= K {
        print(String(repeating: "1", count: K))
    } else {
        var left = 0, right = N
        var answer: [Int] = []
        while left <= right {
            let mid = (right + left) / 2
            var distance = 0
            var check = [0]
            for i in 0..<K {
                if list[i] - list[distance] >= mid {
                    distance = i
                    check.append(i)
                }
                if check.count == M {
                    break
                }
            }
            if check.count == M {
                left = mid + 1
                answer = check
            } else {
                right = mid - 1
            }
        }
        var tempt = Array(repeating: "0", count: K)
        answer.forEach{tempt[$0] = "1"}
        print(tempt.joined())
    }
}
