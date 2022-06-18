//
//  체육복.swift
//  Algorithm
//  - 그리디
//  Created by 전소영 on 2021/03/19.
//

import Foundation

func getGymClothesCount(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var students = [Int](repeating: 1, count: n)
    for l in lost {
        students[l - 1] = 0
    }
    for r in reserve {
        students[r - 1] += 1
    }
    
    var count = 0
    for i in 0..<n {
        if students[i] == 0 {
            if i > 0 && students[i - 1] > 1 {
                students[i] = 1
                students[i - 1] = 1
            } else if i < n - 1 && students[i + 1] > 1 {
                students[i] = 1
                students[i + 1] = 1
            } else {
                count += 1
            }
        }
    }
    
    return n - count
}
