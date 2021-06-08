//
//  K번째 수.swift
//  Algorithm
//  - 정렬, 이분탐색
//  Created by 전소영 on 2021/06/07.
//

import Foundation

func k() {
    let readline = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = readline[0]
    let secondReadline = readLine()!.split(separator: " ").map{ Int($0)! }
    let k = secondReadline[0]
    var start = 1
    var end = n * n
    var result = 0
    var count = 0

    while start <= end {
        let mid = (start + end) / 2
        count = 0
        for i in 1...n {
            count += min((mid / i), n)
        }
        if count >= k {
            result = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    print(result)
}
