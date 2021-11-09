//
//  입국심사.swift
//  Algorithm
//  - 이분탐색
//  Created by 전소영 on 2021/11/08.
//

import Foundation

func solution(_ n: Int, _ times: [Int]) -> Int64 {
    var (left,right) = (Int64(1),Int64(times.max()!) * Int64(n))
    
    return binarySearch(times: times, n: n, left: &left, right: &right)
}

func binarySearch(times: [Int], n: Int, left: inout Int64, right: inout Int64) -> Int64 {
    var minTime: Int64 = 0
    
    while left <= right {
        let mid = (left + right) / 2
        let peopleCount = times.map { mid / Int64($0) }.reduce(0,+)

        if peopleCount >= n {
            minTime = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return minTime
}
