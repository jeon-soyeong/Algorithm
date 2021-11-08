//
//  디스크 컨트롤러.swift
//  Algorithm
//  - 힙(Heap)
//  Created by 전소영 on 2021/11/05.
//

import Foundation

func solution(_ jobs: [[Int]]) -> Int {
    var time = 0
    var total = 0
    var jobsSort = jobs.sorted(by: { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] })

    while jobsSort.count > 0 {
        for i in 0..<jobsSort.count {
            if jobsSort[i][0] <= time {
                time += jobsSort[i][1]
                total += time - jobsSort[i][0]
                jobsSort.remove(at: i)
                break
            }
            
            if i == jobsSort.count - 1 {
                time += 1
            }
        }
    }
    
    return total / jobs.count
}
