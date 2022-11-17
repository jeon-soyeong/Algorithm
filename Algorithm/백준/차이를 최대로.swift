//
//  차이를 최대로.swift
//  Algorithm
//  - 순열, 완전탐색
//  Created by 전소영 on 2022/11/17.
//

import Foundation
// 6
// 20 1 15 8 4 10
// -> 62
func solution10819() {
    let n = Int(readLine()!)!
    var array = readLine()!.split(separator: " ").map { Int(String($0))! }
    var maxValue = 0

    func calculateSum(_ array: [Int]) -> Int {
        var sum = 0

        for i in 0..<array.count - 1 {
            sum += abs(array[i] - array[i + 1])
        }
        return sum
    }

    func permutation(_ n: Int) {
        if n == 0 {
            maxValue = max(maxValue, calculateSum(array))
        } else {
            permutation(n - 1)
            for i in 0..<n {
                array.swapAt(i, n)
                permutation(n - 1)
                array.swapAt(i, n)
            }
        }
    }

    permutation(array.count - 1)
    print(maxValue)
}
