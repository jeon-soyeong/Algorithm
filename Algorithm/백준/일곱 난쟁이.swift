//
//  일곱 난쟁이.swift
//  Algorithm
//
//  Created by 전소영 on 2022/11/18.
//

import Foundation
//20
//7
//23
//19
//10
//15
//25
//8
//13
func solution2309() {
    var heights: [Int] = []
    var results: [Int] = []
    let sum = 100

    for _ in 0..<9 {
        let height = Int(readLine()!)!
        heights.append(height)
    }

    func calculateSum(_ array: [Int]) -> Int {
        return array.reduce(0, +)
    }

    func combination(_ target: [Int], _ targetCount: Int, _ index: Int, _ temp: [Int]) {
        if temp.count == targetCount,
           calculateSum(temp) == sum {
            results = temp
            return
        }

        for i in index..<target.count {
            combination(target, targetCount, i + 1, temp + [target[i]])
        }
    }

    combination(heights, 7, 0, [])
    results.sorted().forEach { height in
        print(height)
    }
}
