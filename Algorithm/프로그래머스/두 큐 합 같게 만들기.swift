//
//  두 큐 합 같게 만들기.swift
//  Algorithm
//
//  Created by 전소영 on 2022/10/31.
//

import Foundation

func solution118667(_ queue1: [Int], _ queue2: [Int]) -> Int {
    var answer = 0
    let queueArray = queue1 + queue2
    var queue1Sum = queue1.reduce(0, +)
    let queue2Sum = queue2.reduce(0, +)
    var left = 0
    var right = queue1.count
    let target = (queue1Sum + queue2Sum) / 2

    if target < queueArray.max() ?? 0 || (queue1Sum + queue2Sum) % 2 != 0 {
        return -1
    }

    while right < queueArray.count, left < right {
        if queue1Sum > target {
            queue1Sum -= queueArray[left]
            left += 1
        } else if queue1Sum < target {
            queue1Sum += queueArray[right]
            right += 1
        } else {
            break
        }
        answer += 1
    }

    if queue1Sum != target {
        return -1
    }

    return answer
}
