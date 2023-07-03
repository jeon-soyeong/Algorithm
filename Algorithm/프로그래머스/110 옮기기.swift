//
//  110 옮기기.swift
//  Algorithm
//
//  Created by 전소영 on 2023/07/04.
//

import Foundation
// s                                    result
// ["1110","100111100","0111111010"]    ["1101","100110110","0110110111"]
func solution77886(_ s: [String]) -> [String] {
    var answer: [String] = []

    for string in s {
        var temp: [String] = []
        let characters = Array(string)
        var addString = ""
        var index = 0

        for c in characters {
            temp.append(String(c))
            if temp.count >= 3, temp[temp.count - 3] == "1", temp[temp.count - 2] == "1", temp[temp.count - 1] == "0" {
                for _ in 0..<3 {
                    temp.removeLast()
                }
                addString += "110"
            }
        }

        for i in stride(from: temp.count - 1, through: 0, by: -1) {
            if temp[i] == "0" {
                index = i + 1
                break
            }
        }

        temp.insert(addString, at: index)
        answer.append(temp.joined())
    }

    return answer
}
