//
//  홀짝 만들기.swift
//  Algorithm
//  - 백트래킹
//  Created by 전소영 on 2022/04/11.
//

import Foundation

func solution(_ numbers: [[Int]]) -> [[Int]] {
    var answer: [[Int]] = []
    dfs(numbers: numbers, depth: 0, answer: &answer, history: [])
    return answer
}

// [[1,2,3], [4,5,6], [7,8,9]]
func dfs(numbers: [[Int]], depth: Int, answer: inout [[Int]], history: [Int]) {
    if depth == numbers.count {
        answer.append(history)
        return
    }
    //숫자가 아무것도 없을 경우 history에 넣어줌.
    if history.isEmpty {
        for n in numbers[depth] {
            var newHistory = history
            newHistory.append(n)
            dfs(numbers: numbers, depth: depth + 1, answer: &answer, history: newHistory)
        }
    } else {
        for n in numbers[depth] {
            //마지막 숫자가 짝수고 n이 홀수라면
            if history.last! % 2 == 0 && n % 2 != 0 {
                var newHistory = history
                newHistory.append(n)
                dfs(numbers: numbers, depth: depth + 1, answer: &answer, history: newHistory)
            }
            //마지막 숫자가 홀수고 n이 짝수라면
            if history.last! % 2 != 0 && n % 2 == 0 {
                var newHistory = history
                newHistory.append(n)
                dfs(numbers: numbers, depth: depth + 1, answer: &answer, history: newHistory)
            }
        }
    }
}
