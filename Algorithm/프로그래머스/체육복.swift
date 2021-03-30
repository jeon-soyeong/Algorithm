//
//  체육복.swift
//  Algorithm
//  - 그리디
//  Created by 전소영 on 2021/03/19.
//

import Foundation

func getGymClothesCount(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var count = n - lost.count //참여 가능한 수
    var lostArray = lost.filter { !reserve.contains($0) }
    let reserveArray = reserve.filter { !lost.contains($0) }
    
    for i in 0..<reserve.count {
        for j in 0..<lost.count {
            if reserve[i] == lost[j] {
                count += 1
            }
        }
    }
    
    for i in 0..<reserveArray.count {
        for j in 0..<lostArray.count {
            if reserveArray[i] - 1 == lostArray[j] || reserveArray[i] + 1 == lostArray[j] {
                lostArray.remove(at: j)
                count += 1
                break
            }
        }
    }
    
    return count
}
