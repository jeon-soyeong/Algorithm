//
//  퍼즐.swift
//  Algorithm
//
//  Created by 전소영 on 2023/12/12.
//

import Foundation
// 1 0 3
// 4 2 5
// 7 8 6
func solution1525() {
    var array: [[Int]] = []
    let puzzleArray = [[1, 2, 3], [4, 5, 6], [7, 8, 0]]

    for _ in 0..<3 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        array.append(input)
    }

    if array == puzzleArray {
        print(0)
    } else {
        var answer = -1
        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
        var visited: [[[Int]]: Bool] = [:]
        var zero: [Int] = []
        var index = 0

        for i in 0..<3 {
            for j in 0..<3 {
                if array[i][j] == 0 {
                    zero = [i, j]
                }
            }
        }

        var queue = [(array, zero[0], zero[1], 0)] // 현재 array, zero 위치, count

        while queue.count > index { // isEmpty -> 시간초과
            let q = queue[index]
            let qArray = q.0, qx = q.1, qy = q.2, count = q.3
            if qArray == puzzleArray {
               answer = count // 정답 array 도달시
            }

            for direction in directions {
                let dx = qx + direction[0], dy = qy + direction[1]

                if (0..<3).contains(dx), (0..<3).contains(dy) {
                    var swapArray = qArray
                    let temp = qArray[qx][qy]
                    swapArray[qx][qy] = swapArray[dx][dy]
                    swapArray[dx][dy] = temp
                    if visited[swapArray] == nil {
                        visited[swapArray] = true
                        queue.append((swapArray, dx, dy, count + 1))
                    }
                }
            }

            index += 1
        }

        print(answer)
    }
}
