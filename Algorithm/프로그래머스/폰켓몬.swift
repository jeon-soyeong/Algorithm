//
//  폰켓몬.swift
//  Algorithm
//
//  Created by 전소영 on 2022/07/19.
//

import Foundation

func ponkemon(nums: [Int]) -> Int {
    let numsCount = nums.count / 2
    let numsSetCount = Set(nums).count

    return min(numsCount, numsSetCount)
}
