//
//  사칙연산.swift
//  Algorithm
//
//  Created by 전소영 on 2022/12/06.
//

import Foundation
//arr                                              result
//["1", "-", "3", "+", "5", "-", "8"]                1
//["5", "-", "3", "+", "1", "+", "2", "-", "4"]      3
func solution1843(_ input_array: [String]) -> Int {
    var maxArray = Array(repeating: Array(repeating: -987654321, count: 201), count: 201)
    var minArray = Array(repeating: Array(repeating: 987654321, count: 201), count: 201) // 뺄셈은 최대가 (큰 값 - 작은 값) 이므로 min도 필요.

    let num = input_array.count / 2 + 1 // 7 / 2 + 1 -> 4 숫자(피연산자의 갯수)

    for i in 0..<num { // 0..<4
        // 문자열이기 때문에 추후 연산을 위해 이를 숫자형(Number)으로 변환
        maxArray[i][i] = Int(input_array[i * 2])! // [[1, 0] [0, 3],[0, 0, 5] [0, 0, 0, 8]]
        minArray[i][i] = Int(input_array[i * 2])! // [[1, 0] [0, 3],[0, 0, 5] [0, 0, 0, 8]]
    }
        // n - 1번 반복 -> 피연산자의 개수가 N일때 총 N-1개의 타입이 존재할 수 있어서
    for n in 1..<num { // 1..<4
        for i in 0..<num - n { // 0..<3~1
            let j = n + i // 1~3 + 0, 3, 2, 1
            for k in i..<j { // 괄호를 하나 줄이고 늘리는 작업
                if input_array[k * 2 + 1] == "-" { // [[1, -2, -7] [0, 3, 8] [0, 0, 5, -3] [0, 0, 0, 8]] ..
                    maxArray[i][j] = max(maxArray[i][k] - minArray[k + 1][j], maxArray[i][j])
                    minArray[i][j] = min(minArray[i][k] - maxArray[k + 1][j], minArray[i][j])
                } else { // "+"
                    maxArray[i][j] = max(maxArray[i][k] + maxArray[k + 1][j], maxArray[i][j])
                    minArray[i][j] = min(minArray[i][k] + minArray[k + 1][j], minArray[i][j])
                }
            }
        }
    }

    return maxArray[0][num -  1]
}

/*
 1. [O] - [1 ~ 3] : O과 1 ~ 3 까지 연산의 결과의 차
 2. [0 ~ 1] + [2 ~ 3] : 0 ~ 1 까지 연산의 결과와 2 ~ 3 까지 연산 결과의 합
 3. [0 ~ 2] - [3] : 0~ 2 까지 연산의 결과와 3 까지 연산 결과의 차
 */
